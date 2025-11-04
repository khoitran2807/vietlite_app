import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vietlite/module/user/auth/domain/entities/premium_config.dart';
import 'package:injectable/injectable.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/user/auth/domain/entities/app_user.dart';
import 'package:vietlite/module/user/auth/domain/repository/i_auth_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

@singleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository repository;

  StreamSubscription<AppUser>? _authSubscription;

  AuthBloc({required this.repository}) : super(AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.map(
        initialize: (_Initialize _) {
          _authSubscription = repository.userChanges().listen((appUser) {
            if (isClosed) return;
            add(AuthEvent.updateUser(appUser));
          });
        },
        updateUser: (_UpdateUser event) {
          emit(state.copyWith(appUser: event.user));
          if (state.isLoggedIn) {
            repository.upsertUser(appUser: event.user);
          }
        },
        signOut: (_SignOut _) async {
          emit(state.copyWith(failureOrSuccessOption: none()));
          final failureOrSuccess = await repository.signOut();

          if (isClosed) return;

          failureOrSuccess.fold(
            (failure) => emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            ),
            (_) {
              emit(
                state.copyWith(
                  appUser: AppUser.empty(),
                  premiumConfig: PremiumConfig.empty(),
                  failureOrSuccessOption: optionOf(failureOrSuccess),
                ),
              );
            },
          );
        },
        changePassword: (_ChangePassword event) async {
          emit(state.copyWith(isLoading: true, failureOrSuccessOption: none()));
          final failureOrSuccess = await repository.changePassword(
            currentPassword: event.currentPassword,
            newPassword: event.newPassword,
          );

          if (isClosed) return;

          emit(
            state.copyWith(
              isLoading: false,
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          );
        },
        getPremiumConfig: (_GetPremiumConfig event) async {
          final failureOrSuccess = await repository.getPremiumConfig(
            userId: state.appUser.id,
          );
          if (isClosed) return;
          failureOrSuccess.fold(
            (failure) => emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            ),
            (premiumConfig) {
              emit(
                state.copyWith(
                  premiumConfig: premiumConfig,
                  failureOrSuccessOption: optionOf(failureOrSuccess),
                ),
              );
            },
          );
        },
        deleteUser: (_DeleteUser event) async {
          final failureOrSuccess = await repository.deleteUser();

          if (isClosed) return;

          failureOrSuccess.fold((failure) => {}, (_) {
            emit(AuthState.initial());
          });
        },
      );
    });
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}

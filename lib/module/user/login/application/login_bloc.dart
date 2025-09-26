import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/user/login/domain/repository/i_login_repository.dart';

import 'package:vietlite/common/value/value_objects.dart';

part 'login_event.dart';

part 'login_state.dart';

part 'login_bloc.freezed.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ILoginRepository repository;

  LoginBloc({required this.repository}) : super(LoginState.initial()) {
    on<LoginEvent>((event, emit) async {
      await event.map(
        anonymousSignIn: (_AnonymousSignIn event) async {
          emit(
            state.copyWith(
              isAnonymousSignIn: true,
              failureOrSuccessOption: none(),
            ),
          );
          final failureOrSuccess = await repository.anonymousSignIn();

          if (isClosed) return;

          failureOrSuccess.fold(
            (failure) => emit(
              state.copyWith(
                isAnonymousSignIn: false,
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            ),
            (_) {
              emit(
                state.copyWith(
                  isAnonymousSignIn: false,
                  failureOrSuccessOption: optionOf(failureOrSuccess),
                ),
              );
            },
          );
        },
        signInWithEmailAndPassword: (_SignInWithEmailAndPassword event) async {
          emit(
            state.copyWith(
              isSignInWithEmailAndPassword: true,
              failureOrSuccessOption: none(),
            ),
          );
          final failureOrSuccess = await repository.signInWithEmailAndPassword(
            email: event.email.getValue(),
            password: event.password.getValue(),
          );

          if (isClosed) return;

          failureOrSuccess.fold(
            (failure) => emit(
              state.copyWith(
                isSignInWithEmailAndPassword: false,
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            ),
            (_) {
              emit(
                state.copyWith(
                  isSignInWithEmailAndPassword: false,
                  failureOrSuccessOption: optionOf(failureOrSuccess),
                ),
              );
            },
          );
        },
        signInWithGoogle: (_SignInWithGoogle event) async {
          emit(
            state.copyWith(
              isSignInWithGoogle: true,
              failureOrSuccessOption: none(),
            ),
          );
          final failureOrSuccess = await repository.signInWithGoogle();

          if (isClosed) return;

          failureOrSuccess.fold(
            (failure) => emit(
              state.copyWith(
                isSignInWithGoogle: false,
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            ),
            (_) {
              emit(
                state.copyWith(
                  isSignInWithGoogle: false,
                  failureOrSuccessOption: optionOf(failureOrSuccess),
                ),
              );
            },
          );
        },
      );
    });
  }
}

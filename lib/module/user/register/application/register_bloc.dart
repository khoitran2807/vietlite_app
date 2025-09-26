import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/user/register/domain/repository/i_register_repository.dart';
import 'package:injectable/injectable.dart';

import 'package:vietlite/common/value/value_objects.dart';

part 'register_event.dart';

part 'register_state.dart';

part 'register_bloc.freezed.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final IRegisterRepository repository;

  RegisterBloc({required this.repository}) : super(RegisterState.initial()) {
    on<RegisterEvent>((event, emit) async {
      await event.map(
        registerWithEmailAndPassword: (
          _RegisterWithEmailAndPassword event,
        ) async {
          emit(
            state.copyWith(isRegister: true, failureOrSuccessOption: none()),
          );
          final failureOrSuccess = await repository
              .registerWithEmailAndPassword(
                email: event.email.getValue(),
                password: event.password.getValue(),
                name: event.name,
              );
          if (isClosed) return;
          failureOrSuccess.fold(
            (failure) => emit(
              state.copyWith(
                isRegister: false,
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            ),
            (_) {
              emit(
                state.copyWith(
                  isRegister: false,
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

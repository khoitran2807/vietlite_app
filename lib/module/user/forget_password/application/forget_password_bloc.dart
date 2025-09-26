import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vietlite/module/user/forget_password/domain/repository/i_forget_password_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:vietlite/common/error/app_failure.dart';

import 'package:vietlite/common/value/value_objects.dart';

part 'forget_password_event.dart';

part 'forget_password_state.dart';

part 'forget_password_bloc.freezed.dart';

@injectable
class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  final IForgetPasswordRepository repository;

  ForgetPasswordBloc({required this.repository})
    : super(ForgetPasswordState.initial()) {
    on<ForgetPasswordEvent>((event, emit) async {
      await event.map(
        forgetPassword: (_ForgetPassword event) async {
          emit(
            state.copyWith(
              isForgetPassword: true,
              failureOrSuccessOption: none(),
            ),
          );
          final failureOrSuccess = await repository.forgetPassword(
            email: event.email.getValue(),
          );
          if (isClosed) return;
          failureOrSuccess.fold(
            (failure) => emit(
              state.copyWith(
                isForgetPassword: false,
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            ),
            (_) {
              emit(
                state.copyWith(
                  isForgetPassword: false,
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

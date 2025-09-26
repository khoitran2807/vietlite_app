import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/discover/thing_detail/domain/i_thing_detail_repository.dart';
import 'package:vietlite/module/discover/things/domain/entities/thing.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:vietlite/module/progress/domain/repository/i_progress_repository.dart';
import 'package:injectable/injectable.dart';

part 'thing_detail_event.dart';

part 'thing_detail_state.dart';

part 'thing_detail_bloc.freezed.dart';

@injectable
class ThingDetailBloc extends Bloc<ThingDetailEvent, ThingDetailState> {
  IThingDetailRepository repository;
  final IProgressRepository progressRepository;

  ThingDetailBloc({required this.repository, required this.progressRepository})
    : super(ThingDetailState.initial()) {
    on<ThingDetailEvent>((event, emit) async {
      await event.map(
        getThingDetail: (e) async {
          final results = await Future.wait([
            repository.getThingDetail(id: e.id),
            progressRepository.getUserExercises(
              userId: e.userId,
              progressId: e.id,
            ),
          ]);

          if (isClosed) return;

          final failureOrSuccessThingDetail =
              results[0] as Either<AppFailure, Thing>;
          final failureOrSuccessUserExercises =
              results[1] as Either<AppFailure, List<UserExercise>>;

          Thing updatedThing = state.thing;
          List<UserExercise> updatedExercises = state.exercises;
          Option<Either<AppFailure, dynamic>> fetchFailure = none();

          // Handle thing detail result
          failureOrSuccessThingDetail.fold(
            (failure) {
              fetchFailure = optionOf(failureOrSuccessThingDetail);
            },
            (thing) {
              updatedThing = thing;

              // Handle thing progress result
              failureOrSuccessUserExercises.fold(
                (failure) {
                  fetchFailure = optionOf(failureOrSuccessUserExercises);
                },
                (userExercises) {
                  updatedExercises = userExercises;
                },
              );

              // Emit the new state with updated values and potential failure.
              emit(
                state.copyWith(
                  isLoading: false,
                  thing: updatedThing,
                  exercises: updatedExercises,
                  failureOrSuccessOption: fetchFailure,
                ),
              );
            },
          );
        },
      );
    });
  }
}

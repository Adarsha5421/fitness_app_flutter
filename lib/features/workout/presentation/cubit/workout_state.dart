import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gym_tracker_app/features/workout/domain/entities/work_out_entity.dart';

part 'workout_state.freezed.dart';

@freezed
class WorkOutState with _$WorkOutState {
  const factory WorkOutState({
    // General states
    @Default(false) bool isLoadingState,
    @Default(false) bool isSuccessState,
    String? errorState,

    // WorkOut data
    // UserEntity? userData,
    List<WorkOutEntity>? workOutList,
    String? token,
  }) = _WorkOutState;

  factory WorkOutState.initially() => const WorkOutState();
}

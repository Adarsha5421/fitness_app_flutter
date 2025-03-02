import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gym_tracker_app/common/app_theme/snackbar.dart';
import 'package:gym_tracker_app/features/workout/domain/usecases/work_out_usecase.dart';
import 'package:gym_tracker_app/features/workout/presentation/cubit/workout_state.dart';

// part 'workout_state.dart';

class WorkoutCubit extends Cubit<WorkOutState> {
  WorkOutUsecase workOutUsecase;
  WorkoutCubit({required this.workOutUsecase}) : super(WorkOutState.initially());

  fetchWorkList(BuildContext context) async {
    emit(state.copyWith(isLoadingState: true));

    var result = await workOutUsecase.call(null);
    result.fold((error) {
      emit(state.copyWith(isLoadingState: false));

      showMySnackBar(context, message: 'Something went wrong');
    }, (data) {
      emit(state.copyWith(isLoadingState: false));
      emit(state.copyWith(
        workOutList: data,
        workOutListIntial: data,
        workOutBodyPartsList: ['ALL', ...data.map((e) => e.bodyPart!).toSet()],
      ));
    });
  }

  // filterBodyParts(String x) {
  //   if (x == 'ALl') {
  //     emit(state.copyWith(workOutList: state.workOutListIntial));
  //   } else if (x.toLowerCase() == 'chest') {
  //     emit(
  //       state.copyWith(workOutList: state.workOutListIntial?.where((e) => e.bodyPart?.toLowerCase() == 'chest').toList()),
  //     );
  //   } else if (x.toLowerCase() == 'arms') {}
  // }
  filterBodyParts(String selectedPart) {
    if (selectedPart.toLowerCase() == 'all') {
      emit(state.copyWith(workOutList: state.workOutListIntial));
    } else {
      emit(
        state.copyWith(
          workOutList: state.workOutListIntial?.where((e) => e.bodyPart?.toLowerCase() == selectedPart.toLowerCase()).toList(),
        ),
      );
    }
  }
}

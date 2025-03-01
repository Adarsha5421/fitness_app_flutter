import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gym_tracker_app/common/app_theme/snackbar.dart';
import 'package:gym_tracker_app/core/navigation_services.dart';
import 'package:gym_tracker_app/features/Login/data/datasources/local_datasource/login_local_datasource.dart';
import 'package:gym_tracker_app/features/Login/domain/entities/login_entity.dart';
import 'package:gym_tracker_app/features/Login/domain/usecases/login_usecase.dart';
import 'package:gym_tracker_app/features/Login/presentation/cubit/login_state.dart';
import 'package:gym_tracker_app/features/dashboard/presentation/pages/dashboad_screen.dart';

// part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUserUsecase loginUserUsecase;
  final UserSharedPrefs userSharedPrefs;
  final TokenSharedPrefs tokenSharedPrefs;

  LoginCubit({
    required this.loginUserUsecase,
    required this.userSharedPrefs,
    required this.tokenSharedPrefs,
  }) : super(LoginState.initially());

  loginFx(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(isLoadingState: true));
    final response = await loginUserUsecase.call(LoginUserParams(email: email, password: password));
    response.fold((error) {
      showMySnackBar(context, message: error.message, color: Colors.red);
    }, (success) {
      emit(state.copyWith(isLoadingState: false));
      userSharedPrefs.setUserData(success.user ?? const UserEntity());
      tokenSharedPrefs.saveToken(success.token ?? '');
      navigateAndPushReplacement(context: context, screen: const MyDashboardScreen());
      showMySnackBar(context, message: 'Login Successful');
    });
  }
}

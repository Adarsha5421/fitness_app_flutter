import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gym_tracker_app/core/network/api_services.dart';
import 'package:gym_tracker_app/features/Login/data/datasources/local_datasource/login_local_datasource.dart';
import 'package:gym_tracker_app/features/Login/data/datasources/remote_datasource/user_remote_datsource.dart';
import 'package:gym_tracker_app/features/Login/data/repositories/login_repository_impl.dart';
import 'package:gym_tracker_app/features/Login/domain/repositories/login_repository.dart';
import 'package:gym_tracker_app/features/Login/domain/usecases/login_usecase.dart';
import 'package:gym_tracker_app/features/Login/presentation/cubit/login_cubit.dart';
import 'package:gym_tracker_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  await _initApiService();
  await _initSharedPreferences();
  getIt.registerSingleton<UserRemoteDataSource>(UserRemoteDataSource(dio: getIt()));
  getIt.registerSingleton<UserRemoteRepository>(UserRemoteRepository(userRemoteDataSource: getIt()));
  getIt.registerFactory<IUserRepository>(() => UserRemoteRepository(userRemoteDataSource: getIt<UserRemoteDataSource>()));
  getIt.registerFactory<UserSharedPrefs>(() => UserSharedPrefs());
  getIt.registerFactory<TokenSharedPrefs>(() => TokenSharedPrefs());

  getIt.registerSingleton<LoginUserUsecase>(LoginUserUsecase(userRepository: getIt(), userSharedPrefs: getIt()));
  getIt.registerSingleton<LoginCubit>(LoginCubit(
    loginUserUsecase: getIt(),
    userSharedPrefs: getIt(),
    tokenSharedPrefs: getIt(),
  ));
}

_initApiService() {
  getIt.registerLazySingleton<Dio>(() => ApiService(Dio()).dio);
}

Future<void> _initSharedPreferences() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}

_initHomeDependencies() async {
  getIt.registerSingleton<HomeCubit>(HomeCubit());
}

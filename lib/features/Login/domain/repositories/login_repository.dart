import 'package:dartz/dartz.dart';
import 'package:gym_tracker_app/features/Login/domain/entities/login_entity.dart';

import '../../../../core/error/failure.dart';
// import '../../data/dto/logi ofile_respons.dart';

abstract interface class IUserRepository {
  Future<Either<Failure, LoginEntity>> login(String email, String password);
  Future<Either<Failure, String>> signUp(String email, String password, String name);

  // Future<Either<Failure, EditProfileResponse>> updateProfile(String name, File? image);
}

import 'package:dio/dio.dart';
import 'package:gym_tracker_app/core/api_endpoints.dart';
import 'package:gym_tracker_app/features/Login/data/models/login_modal.dart';

class UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSource({required this.dio});

  /// Signs up a user
  Future<String> signUp(String email, String password, String name) async {
    try {
      var response = await dio.post(APIEndPoints.signUpUrl, data: {'email': email, 'password': password, 'name': name});
      if (response.statusCode == 400) throw Exception(response.data['error']);
      return response.data['message'];
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Logs in a user
  Future<LoginModal> login(String email, String password) async {
    try {
      Response response = await dio.post(APIEndPoints.loginUrl, data: {'email': email, 'password': password});
      if (response.statusCode == 400 || response.statusCode == 401) throw Exception(response.data['error']);
      final responseData = response.data;
      return LoginModal.fromJson(responseData);
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Future<EditProfileResponse> updateProfile(String name, File? image) async {
  //   try {
  //     FormData formData = FormData.fromMap({
  //       "name": name,
  //       if (image != null)
  //         "profileImage": await MultipartFile.fromFile(
  //           image.path,
  //           filename: image.path.split("/").last + DateTime.now().toString(),
  //           contentType: DioMediaType.parse('image/jpeg'),
  //         ),
  //     });

  //     Response response = await _dio.post(
  //       APIEndPoints.editProfileUrl,
  //       data: formData,
  //       options: Options(headers: {"Content-Type": "multipart/form-data"}),
  //     );

  //     // return EditProfileResponse.fromJson(response.data);
  //   } on DioException catch (e) {
  //     throw Exception('Dio Error: ${e.message ?? 'Unknown error'}');
  //   } catch (e) {
  //     throw Exception('An unexpected error occurred: $e');
  //   }
  // }
}

import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/exceptions.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/auth/data/data_source/remote/auth_remote_api_data_source.dart';
import 'package:movie_app/features/auth/data/model/login_request.dart';
import 'package:movie_app/features/auth/data/model/login_response.dart';
import 'package:movie_app/features/auth/data/model/register_request.dart';
import 'package:movie_app/features/auth/data/model/register_response.dart';

class AuthRepository {
  final AuthRemoteAPIDataSource _authRemoteAPIDataSource =
      AuthRemoteAPIDataSource();

  Future<Either<Failure, RegisterResponse>> register(
    RegisterRequest request,
  ) async {
    try {
      final response = await _authRemoteAPIDataSource.register(request);
      return Right(response);
    } on RegisterException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  Future<Either<Failure, LoginResponse>> login(LoginRequest request) async {
    try {
      final response = await _authRemoteAPIDataSource.login(request);
      print(" AyAaaaaaaa${response.message}");
      return Right(response);
    } on LoginException catch (exception) {
      return Left(Failure(exception.message));
    }
  }
}

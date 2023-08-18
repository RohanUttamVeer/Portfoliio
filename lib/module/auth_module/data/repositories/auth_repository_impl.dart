import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/auth_register.dart';
import '../../domain/usecases/auth_set_is_login.dart';
import '../datasources/local/local_remote_datasources.dart';
import '../datasources/remote/auth_remote_datasources.dart';

class AuthRepositoryImpl implements AuthRepository {
  /// Data Source
  final AuthRemoteDatasource authRemoteDatasource;
  final AuthLocalDatasource authLocalDatasource;

  const AuthRepositoryImpl(
    this.authRemoteDatasource,
    this.authLocalDatasource,
  );

  @override
  Future<Either<Failure, User>> googleAuth() async {
    try {
      final response = await authRemoteDatasource.googleAuth();
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, User>> register(
    RegisterParams registerParams,
  ) async {
    try {
      final response = await authRemoteDatasource.register(registerParams);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, bool>> setLoggedIn(
    SetLoginParams params,
  ) async {
    try {
      final response = authLocalDatasource.setLoggedIn(params);
      return Right(response);
    } on ServerException catch (e) {
      return Left(CacheFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, bool>> getLoggedIn(
  ) async {
    try {
      final response = authLocalDatasource.getLoggedIn();
      return Right(response);
    } on ServerException catch (e) {
      return Left(CacheFailure(e.message!));
    }
  }
}

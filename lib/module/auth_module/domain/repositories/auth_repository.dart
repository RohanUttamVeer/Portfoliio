import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/error/failures.dart';
import '../usecases/auth_register.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> register(RegisterParams params);
  Future<Either<Failure, User>> googleAuth();
}

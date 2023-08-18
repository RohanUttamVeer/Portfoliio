import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class AuthRegister extends UseCase<User, RegisterParams> {
  final AuthRepository _repository;

  AuthRegister(this._repository);

  @override
  Future<Either<Failure, User>> call(RegisterParams params) async {
    return await _repository.register(params);
  }
}

class RegisterParams {
  final String email;
  final String password;

  RegisterParams({
    this.email = "",
    this.password = "",
  });
}

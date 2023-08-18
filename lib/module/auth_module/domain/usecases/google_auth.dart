import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class GoogleAuth extends UseCase<User, NoParams> {
  final AuthRepository _repository;

  GoogleAuth(this._repository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await _repository.googleAuth();
  }
}

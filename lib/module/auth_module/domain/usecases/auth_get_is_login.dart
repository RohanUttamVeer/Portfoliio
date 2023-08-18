import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class AuthGetIsLogin extends UseCase<bool, NoParams> {
  final AuthRepository _repository;

  AuthGetIsLogin(this._repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await _repository.getLoggedIn();
  }
}

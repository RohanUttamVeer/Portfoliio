import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class AuthSetIsLogin extends UseCase<bool, SetLoginParams> {
  final AuthRepository _repository;

  AuthSetIsLogin(this._repository);

  @override
  Future<Either<Failure, bool>> call(SetLoginParams params) async {
    return await _repository.setLoggedIn(params);
  }
}

class SetLoginParams {
  final bool value;

  SetLoginParams({
    this.value = false,
  });
}

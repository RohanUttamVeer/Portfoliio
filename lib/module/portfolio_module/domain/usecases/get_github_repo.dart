import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/data_list.dart';
import '../repositories/portfolio_repository.dart';

class GetGithubRepo extends UseCase<DataList, NoParams> {
  final PortfolioRepository _repository;

  GetGithubRepo(this._repository);

  @override
  Future<Either<Failure, DataList>> call(NoParams params) async {
    return await _repository.getGithubRepo();
  }
}

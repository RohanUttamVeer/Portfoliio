import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/data_list.dart';
import '../../domain/repositories/portfolio_repository.dart';
import '../datasources/remote/portfolio_remote_datasources.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  /// Data Source
  final PortfolioRemoteDatasource remoteDatasource;

  PortfolioRepositoryImpl({
    required this.remoteDatasource,
  });

  @override
  Future<Either<Failure, DataList>> getGithubRepo() async {
    try {
      final response = await remoteDatasource.getGithubRepo();
      return Right(response.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}

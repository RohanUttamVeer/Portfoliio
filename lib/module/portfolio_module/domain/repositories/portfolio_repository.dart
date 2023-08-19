import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/data_list.dart';

abstract class PortfolioRepository {
  Future<Either<Failure, DataList>> getGithubRepo();
}

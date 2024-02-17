import 'package:crypto/features/cryptocurrencies/domain/entity/cryptocurrency.dart';
import 'package:dartz/dartz.dart';

abstract class FavoriteRepository {
  Future<Either<String, bool>> put({
    required Cryptocurrency cryptocurrency,
    required String userId,
  });
  Future<Either<String, bool>> delete({
    required Cryptocurrency cryptocurrency,
    required String userId,
  });
  Future<Either<String, Set<Cryptocurrency>>> get({required String userId});
}

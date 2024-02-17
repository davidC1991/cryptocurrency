import 'package:crypto/features/cryptocurrencies/domain/entity/cryptocurrency.dart';
import 'package:crypto/features/favorites/data/data_sources/favorites_datasource.dart';
import 'package:crypto/features/favorites/domain/repository/favorite_repository.dart';
import 'package:dartz/dartz.dart';

class FavoriteDataSourceImpl implements FavoriteRepository {
  final FavoriteDataSourceRepository favoriteDataSourceRepository;
  const FavoriteDataSourceImpl(this.favoriteDataSourceRepository);
  @override
  Future<Either<String, bool>> delete(
      {required Cryptocurrency cryptocurrency, required String userId}) async {
    return favoriteDataSourceRepository.delete(
        cryptocurrency: cryptocurrency, userId: userId);
  }

  @override
  Future<Either<String, Set<Cryptocurrency>>> get(
      {required String userId}) async {
    return favoriteDataSourceRepository.get(userId: userId);
  }

  @override
  Future<Either<String, bool>> put(
      {required Cryptocurrency cryptocurrency, required String userId}) async {
    return favoriteDataSourceRepository.put(
        cryptocurrency: cryptocurrency, userId: userId);
  }
}

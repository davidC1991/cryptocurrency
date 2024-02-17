import 'package:crypto/features/cryptocurrencies/domain/entity/cryptocurrency.dart';
import 'package:crypto/features/favorites/domain/repository/favorite_repository.dart';
import 'package:dartz/dartz.dart';

class Favorites {
  FavoriteRepository favoriteRepository;
  Favorites(this.favoriteRepository);

  Future<Either<String, bool>> delete(
      {required Cryptocurrency cryptocurrency, required String userId}) async {
    return favoriteRepository.delete(
        cryptocurrency: cryptocurrency, userId: userId);
  }

  Future<Either<String, Set<Cryptocurrency>>> get(
      {required String userId}) async {
    return favoriteRepository.get(userId: userId);
  }

  Future<Either<String, bool>> put(
      {required Cryptocurrency cryptocurrency, required String userId}) async {
    return favoriteRepository.put(
        cryptocurrency: cryptocurrency, userId: userId);
  }
}

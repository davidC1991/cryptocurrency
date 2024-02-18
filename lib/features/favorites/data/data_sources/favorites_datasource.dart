import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/core/third_party_package/firebase/firebase_repository.dart';
import 'package:crypto/features/cryptocurrencies/data/model/cryptocurrency_model.dart';
import 'package:crypto/features/cryptocurrencies/domain/entity/cryptocurrency.dart';
import 'package:dartz/dartz.dart';

abstract class FavoriteDataSourceRepository {
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

class FavoriteDataSourceFirebaseProvider
    implements FavoriteDataSourceRepository {
  final FirebaseClient _firebaseClient;
  FavoriteDataSourceFirebaseProvider(this._firebaseClient);
  @override
  Future<Either<String, bool>> delete(
      {required Cryptocurrency cryptocurrency, required String userId}) async {
    try {
      await _firebaseClient
          .update(mainCollection: 'favorites', userId: userId, data: {
        'favorites': FieldValue.arrayRemove(
          [
            {
              'current_price': cryptocurrency.currentPrice,
              'id': cryptocurrency.id,
              'image': cryptocurrency.image,
              'name': cryptocurrency.name,
              'symbol': cryptocurrency.symbol,
            }
          ],
        )
      });

      return const Right(true);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Set<Cryptocurrency>>> get({
    required String userId,
  }) async {
    try {
      final collection = await _firebaseClient.getAllByUser(
          userId: userId, mainCollection: 'favorites');
      Set<Cryptocurrency> cryptocurrencies = {};
      if (collection.exists) {
        final Map<String, dynamic>? data = collection.data();

        if (data != null) {
          for (var value in data['favorites']) {
            cryptocurrencies.add(CryptocurrencyModel.fromJson(value));
          }
        }
        return Right(cryptocurrencies);
      }
      return const Left('Error to get favorites');
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> put(
      {required Cryptocurrency cryptocurrency, required String userId}) async {
    try {
      _firebaseClient
          .update(mainCollection: 'favorites', userId: userId, data: {
        'favorites': FieldValue.arrayUnion(
          [
            {
              'current_price': cryptocurrency.currentPrice,
              'id': cryptocurrency.id,
              'image': cryptocurrency.image,
              'name': cryptocurrency.name,
              'symbol': cryptocurrency.symbol,
            }
          ],
        )
      }).catchError((onError) async {
        await _firebaseClient
            .set(mainCollection: 'favorites', userId: userId, data: {
          'favorites': [
            {
              'current_price': cryptocurrency.currentPrice,
              'id': cryptocurrency.id,
              'image': cryptocurrency.image,
              'name': cryptocurrency.name,
              'symbol': cryptocurrency.symbol,
            }
          ]
        });
      });

      return const Right(true);
    } catch (e) {
      return Left(e.toString());
    }
  }
}

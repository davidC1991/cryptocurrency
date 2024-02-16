import 'package:crypto/features/cryptocurrencies/data/model/cryptocurrency_model.dart';
import 'package:dartz/dartz.dart';

abstract class CryptocurrencyDataSourceRepository {
  Future<Either<String, CryptocurrencyModel>> getCryptocurrencies();
}

class CryptocurrencyDataSourceWith
    implements CryptocurrencyDataSourceRepository {
  @override
  Future<Either<String, CryptocurrencyModel>> getCryptocurrencies() async {
    try {
      //TODO: MAKE POST, PUT, GET, DELETE OR POST AND RETURN DATA
      return Right(CryptocurrencyModel());
    } catch (e) {
      return Left(e.toString());
    }
  }
}

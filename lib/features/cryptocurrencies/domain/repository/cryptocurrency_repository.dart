import 'package:crypto/features/cryptocurrencies/domain/entity/cryptocurrency.dart';
import 'package:dartz/dartz.dart';

abstract class CryptocurrencyRepository {
  Future<Either<String, CryptocurrencyEntity>> getCryptocurrencies();
}

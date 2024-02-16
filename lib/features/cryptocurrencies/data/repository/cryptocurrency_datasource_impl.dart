import 'package:crypto/features/cryptocurrencies/data/datasource/cryptocurrency_datasource.dart';
import 'package:crypto/features/cryptocurrencies/domain/entity/cryptocurrency.dart';
import 'package:crypto/features/cryptocurrencies/domain/repository/cryptocurrency_repository.dart';
import 'package:dartz/dartz.dart';

class CryptocurrencyDataSourceImpl implements CryptocurrencyRepository {
  CryptocurrencyDataSourceRepository cryptocurrencyDataSourceRepository;
  CryptocurrencyDataSourceImpl(this.cryptocurrencyDataSourceRepository);

  @override
  Future<Either<String, CryptocurrencyEntity>> getCryptocurrencies() async {
    final data = await cryptocurrencyDataSourceRepository.getCryptocurrencies();
    return data;
  }
}

import 'package:crypto/features/cryptocurrencies/domain/entity/cryptocurrency.dart';
import 'package:crypto/features/cryptocurrencies/domain/repository/cryptocurrency_repository.dart';
import 'package:dartz/dartz.dart';

class Cryptocurrency {
  final CryptocurrencyRepository cryptocurrencyRepository;

  Cryptocurrency(this.cryptocurrencyRepository);

  Future<Either<String, CryptocurrencyEntity>> call() async {
    return cryptocurrencyRepository.getCryptocurrencies();
  }
}

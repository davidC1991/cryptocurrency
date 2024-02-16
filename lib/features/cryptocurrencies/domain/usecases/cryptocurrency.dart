import 'package:crypto/features/cryptocurrencies/domain/entity/cryptocurrency.dart';
import 'package:crypto/features/cryptocurrencies/domain/repository/cryptocurrency_repository.dart';
import 'package:dartz/dartz.dart';

class Cryptocurrencies {
  final CryptocurrencyRepository cryptocurrencyRepository;

  Cryptocurrencies(this.cryptocurrencyRepository);

  Future<Either<String, List<Cryptocurrency>>> call() async {
    return cryptocurrencyRepository.getCryptocurrencies();
  }
}

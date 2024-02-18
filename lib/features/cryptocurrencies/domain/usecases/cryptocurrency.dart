import 'package:crypto/features/cryptocurrencies/domain/entity/cryptocurrency.dart';
import 'package:crypto/features/cryptocurrencies/domain/repository/cryptocurrency_repository.dart';
import 'package:dartz/dartz.dart';

class CryptocurrenciesUseCase {
  final CryptocurrencyRepository cryptocurrencyRepository;

  CryptocurrenciesUseCase(this.cryptocurrencyRepository);

  Future<Either<String, List<Cryptocurrency>>> call() async {
    return cryptocurrencyRepository.getCryptocurrencies();
  }
}

import 'package:crypto/core/third_party_package/http/http_repository.dart';
import 'package:crypto/features/cryptocurrencies/data/datasource/cryptocurrency_datasource.dart';
import 'package:crypto/features/cryptocurrencies/domain/repository/cryptocurrency_repository.dart';
import 'package:crypto/features/cryptocurrencies/domain/usecases/cryptocurrency.dart';
import 'package:mocktail/mocktail.dart';

class MockCryptocurrenciesRepository extends Mock
    implements CryptocurrencyRepository {}

class MockHttp extends Mock implements HttpClient {}

class MockCryptocurrencyDataSourceRepository extends Mock
    implements CryptocurrencyDataSourceRepository {}

class MockCryptocurrenciesUseCase extends Mock
    implements CryptocurrenciesUseCase {}

import 'package:crypto/features/cryptocurrencies/data/repository/cryptocurrency_datasource_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helper/dummy_cryptocurrencies/dummy_models.dart';
import '../../../../helper/mocks.dart';

void main() {
  late MockCryptocurrencyDataSourceRepository
      mockCryptocurrencyDataSourceRepository;
  late CryptocurrencyDataSourceImpl cryptocurrencyDataSourceImpl;

  setUp(() {
    mockCryptocurrencyDataSourceRepository =
        MockCryptocurrencyDataSourceRepository();
    cryptocurrencyDataSourceImpl =
        CryptocurrencyDataSourceImpl(mockCryptocurrencyDataSourceRepository);
  });
  group('Cryptocurrencies from data-source repository', () {
    test('Should return cryptocurrencies when a call to data is successful ',
        () async {
      when(
        () => mockCryptocurrencyDataSourceRepository.getCryptocurrencies(),
      ).thenAnswer((invocation) async => Right(cryptocurrencies_));

      final result = await cryptocurrencyDataSourceImpl.getCryptocurrencies();

      expect(result, Right(cryptocurrencies_));
    });
    test('Should return an error message when a call to data is fail ',
        () async {
      when(
        () => mockCryptocurrencyDataSourceRepository.getCryptocurrencies(),
      ).thenAnswer(
          (invocation) async => const Left('Error to get cryptocurrencies'));

      final result = await cryptocurrencyDataSourceImpl.getCryptocurrencies();

      expect(result, const Left('Error to get cryptocurrencies'));
    });
  });
}

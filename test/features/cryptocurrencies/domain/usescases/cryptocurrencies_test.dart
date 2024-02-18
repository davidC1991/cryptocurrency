import 'package:crypto/core/extensions/either_extension.dart';
import 'package:crypto/features/cryptocurrencies/domain/entity/cryptocurrency.dart';
import 'package:crypto/features/cryptocurrencies/domain/usecases/cryptocurrency.dart';
import 'package:crypto/features/cryptocurrencies/presentation/enums/compare_enum.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helper/mocks.dart';

Future<void> main() async {
  CryptocurrenciesUseCase cryptocurrencies;
  MockCryptocurrenciesRepository mockCryptocurrenciesRepository;

  setUp(() {});

  mockCryptocurrenciesRepository = MockCryptocurrenciesRepository();
  cryptocurrencies = CryptocurrenciesUseCase(mockCryptocurrenciesRepository);

  List<Cryptocurrency> cryptocurrencies_ = [
    Cryptocurrency(
      currentPrice: 12.0,
      name: 'BitCoin',
      symbol: 'bit',
      image: '',
      statusCompare: StatusComparingCryptocurrencyEnum.ToCompare,
    )
  ];

  test('get cryptocurrencies from repository', () async {
    when(() => mockCryptocurrenciesRepository.getCryptocurrencies())
        .thenAnswer((_) async => Right(cryptocurrencies_));
    final result = await cryptocurrencies.call();
    expect(result, Right(cryptocurrencies_));
  });
  test('get empty cryptocurrencies from repository', () async {
    when(() => mockCryptocurrenciesRepository.getCryptocurrencies())
        .thenAnswer((_) async => const Right([]));
    final result = await cryptocurrencies.call();
    expect(result.asRight(), []);
  });
}

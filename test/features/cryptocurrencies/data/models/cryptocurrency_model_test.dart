import 'package:crypto/features/cryptocurrencies/data/model/cryptocurrency_model.dart';
import 'package:crypto/features/cryptocurrencies/presentation/enums/compare_enum.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helper/dummy_cryptocurrencies/dummy_cryptocurrency_response.dart';

void main() {
  CryptocurrencyModel cryptocurrencyModel = CryptocurrencyModel(
    id: 'bitcoin',
    name: 'Bitcoin',
    currentPrice: 52200,
    image:
        'https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400',
    symbol: 'btc',
    statusCompare: StatusComparingCryptocurrencyEnum.ToCompare,
  );
  test('should return a model type CryptocurrencyModel', () async {
    expect(cryptocurrencyModel, isA<CryptocurrencyModel>());
  });

  test('deserialization should return a valid CryptocurrencyModel', () async {
    final CryptocurrencyModel cryptocurrency =
        CryptocurrencyModel.fromJson(fake_cryptocurrencies_response);

    expect(cryptocurrencyModel, equals(cryptocurrency));
  });
}

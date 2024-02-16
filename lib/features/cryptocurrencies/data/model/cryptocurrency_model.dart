import 'package:crypto/features/cryptocurrencies/domain/entity/cryptocurrency.dart';

CryptocurrencyModel cryptocurrencyFromjson(Map<String, dynamic> json) =>
    CryptocurrencyModel.fromJson(json);

class CryptocurrencyModel extends CryptocurrencyEntity {
  const CryptocurrencyModel() : super();

  //TODO: WRITE THE ENTITIES

  factory CryptocurrencyModel.fromJson(Map<String, dynamic> json) =>
      CryptocurrencyModel();
}

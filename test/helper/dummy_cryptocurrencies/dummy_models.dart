import 'package:crypto/core/const%20/providers/cryptocurrencies_const.dart';
import 'package:crypto/features/cryptocurrencies/data/model/cryptocurrency_model.dart';
import 'package:crypto/features/cryptocurrencies/presentation/enums/compare_enum.dart';

List<CryptocurrencyModel> cryptocurrencies_ = [
  CryptocurrencyModel(
    id: "bitcoin",
    symbol: "btc",
    name: "Bitcoin",
    image: imageDefaultCoingecko,
    currentPrice: 52200,
    statusCompare: StatusComparingCryptocurrencyEnum.ToCompare,
  )
];

import 'dart:convert';

import 'package:crypto/features/cryptocurrencies/domain/entity/cryptocurrency.dart';
import 'package:crypto/features/cryptocurrencies/presentation/enums/compare_enum.dart';

List<CryptocurrencyModel> cryptocurrencyModelFromJson(String str) =>
    List<CryptocurrencyModel>.from(
        json.decode(str).map((x) => CryptocurrencyModel.fromJson(x)));

// ignore: must_be_immutable
class CryptocurrencyModel extends Cryptocurrency {
  final String? id;
  final String? symbol;
  final String? name;
  final String? image;
  final double? currentPrice;
  StatusComparingCryptocurrencyEnum? statusCompare;

  CryptocurrencyModel({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
    this.statusCompare,
  }) : super(
          id: id,
          symbol: symbol,
          name: name,
          image: image,
          currentPrice: currentPrice,
          statusCompare: statusCompare,
        );

  factory CryptocurrencyModel.fromJson(Map<String, dynamic> json) =>
      CryptocurrencyModel(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        image: json["image"],
        currentPrice: json["current_price"].toDouble(),
        statusCompare: StatusComparingCryptocurrencyEnum.ToCompare,
      );
}

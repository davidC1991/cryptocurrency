import 'package:crypto/features/cryptocurrencies/domain/entity/cryptocurrency.dart';
import 'dart:convert';

List<CryptocurrencyModel> cryptocurrencyModelFromJson(String str) =>
    List<CryptocurrencyModel>.from(
        json.decode(str).map((x) => CryptocurrencyModel.fromJson(x)));

class CryptocurrencyModel extends Cryptocurrency {
  final String? id;
  final String? symbol;
  final String? name;
  final String? image;
  final double? currentPrice;

  const CryptocurrencyModel({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
  }) : super(
          id: id,
          symbol: symbol,
          name: name,
          image: image,
          currentPrice: currentPrice,
        );

  factory CryptocurrencyModel.fromJson(Map<String, dynamic> json) =>
      CryptocurrencyModel(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        image: json["image"],
        currentPrice: json["current_price"].toDouble(),
      );
}

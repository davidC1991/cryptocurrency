import 'package:crypto/features/cryptocurrencies/presentation/enums/compare_enum.dart';
import 'package:equatable/equatable.dart';

class Cryptocurrency extends Equatable {
  final String? id;
  final String? symbol;
  final String? name;
  final String? image;
  final double? currentPrice;
  StatusComparingCryptocurrencyEnum? statusCompare;

  Cryptocurrency({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
    this.statusCompare,
  });

  @override
  List<Object?> get props => [
        id,
        symbol,
        name,
        image,
        currentPrice,
        statusCompare,
      ];
}

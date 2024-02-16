import 'package:equatable/equatable.dart';

class Cryptocurrency extends Equatable {
  final String? id;
  final String? symbol;
  final String? name;
  final String? image;
  final double? currentPrice;

  const Cryptocurrency({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
  });

  @override
  List<Object?> get props => [
        id,
        symbol,
        name,
        image,
        currentPrice,
      ];
}

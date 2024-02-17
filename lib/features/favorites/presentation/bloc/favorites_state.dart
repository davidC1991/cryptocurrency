part of 'favorites_bloc.dart';

// ignore: must_be_immutable
class FavoritesState extends Equatable {
  FavoritesState({
    this.favoritesCryptocurrencies = const {},
  });
  Set<Cryptocurrency> favoritesCryptocurrencies;

  FavoritesState copyWith({
    Set<Cryptocurrency>? favoritesCryptocurrencies,
  }) =>
      FavoritesState(
          favoritesCryptocurrencies:
              favoritesCryptocurrencies ?? this.favoritesCryptocurrencies);
  @override
  List<Object> get props => [favoritesCryptocurrencies];
}

// ignore: must_be_immutable
final class FavoritesInitial extends FavoritesState {}

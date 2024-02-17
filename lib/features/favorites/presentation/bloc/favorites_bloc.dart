import 'package:bloc/bloc.dart';
import 'package:crypto/features/cryptocurrencies/domain/entity/cryptocurrency.dart';
import 'package:crypto/features/favorites/domain/usecases/favorites.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc(Favorites favorites)
      : _favorites = favorites,
        super(FavoritesInitial()) {
    on<FavoritesEvent>((event, emit) async {
      if (event is PutFavorite) {
        _putFavorite(event);
        return;
      }
      if (event is GetFavorites) {
        _getFavorites(event);
        return;
      }
      if (event is RemoveFavorite) {
        _removeFavorite(event);
        return;
      }
    });
  }

  final Favorites _favorites;

  void _getFavorites(GetFavorites event) async {
    final result = await _favorites.get(userId: event.userId);
    result.fold(
      (error) => null,
      // ignore: invalid_use_of_visible_for_testing_member
      (favorites) => emit(
        state.copyWith(
          favoritesCryptocurrencies: favorites,
        ),
      ),
    );
  }

  void _putFavorite(PutFavorite event) async {
    final result = await _favorites.put(
        cryptocurrency: event.cryptocurrency, userId: event.userId);
    final Set<Cryptocurrency> newFavorites =
        Set.from(state.favoritesCryptocurrencies);
    newFavorites.add(event.cryptocurrency);
    result.fold(
      (error) => null,
      // ignore: invalid_use_of_visible_for_testing_member
      (isSuccess) => emit(
        state.copyWith(
          favoritesCryptocurrencies: newFavorites,
        ),
      ),
    );
  }

  void _removeFavorite(RemoveFavorite event) async {
    final result = await _favorites.delete(
      cryptocurrency: event.cryptocurrency,
      userId: event.userId,
    );
    final Set<Cryptocurrency> newFavorites =
        Set.from(state.favoritesCryptocurrencies);
    newFavorites.remove(event.cryptocurrency);
    result.fold(
      (error) => null,
      // ignore: invalid_use_of_visible_for_testing_member
      (isSuccess) => emit(
        state.copyWith(
          favoritesCryptocurrencies: newFavorites,
        ),
      ),
    );
  }
}

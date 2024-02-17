part of 'favorites_bloc.dart';

sealed class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class PutFavorite extends FavoritesEvent {
  final Cryptocurrency cryptocurrency;
  final String userId;
  const PutFavorite({required this.cryptocurrency, required this.userId});
}

class RemoveFavorite extends FavoritesEvent {
  final Cryptocurrency cryptocurrency;
  final String userId;
  const RemoveFavorite({required this.cryptocurrency, required this.userId});
}

class GetFavorites extends FavoritesEvent {
  final String userId;
  const GetFavorites(this.userId);
}

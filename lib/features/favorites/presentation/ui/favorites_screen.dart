import 'package:crypto/core/widgets/texts/text_primary.dart';
import 'package:crypto/features/cryptocurrencies/domain/entity/cryptocurrency.dart';
import 'package:crypto/features/cryptocurrencies/presentation/bloc/cryptocurrencies_bloc.dart';
import 'package:crypto/features/cryptocurrencies/presentation/ui/widgets/cryptocurrency_card.dart';
import 'package:crypto/features/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:crypto/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        if (state.favoritesCryptocurrencies.isEmpty) {
          return _emptyState('You do not have favorites');
        }
        final List<Cryptocurrency> favorites =
            state.favoritesCryptocurrencies.toList();
        return ListView.builder(
          itemCount: state.favoritesCryptocurrencies.length,
          itemBuilder: (context, index) => CryptocurrencyCard(
            name: favorites[index].name ?? '',
            image: favorites[index].image ??
                'https://www.namepros.com/attachments/empty-png.89209/',
            price: favorites[index].currentPrice.toString(),
            coin: 'USD',
            isFavorite: true,
            onPressedFavorite: () => _isFavorite(context, favorites, index),
          ),
        );
      },
    );
  }

  void _isFavorite(
    BuildContext context,
    List<Cryptocurrency> favorites,
    int index,
  ) {
    final String userId =
        BlocProvider.of<LoginBloc>(context).state.userId ?? '';
    BlocProvider.of<FavoritesBloc>(context).add(RemoveFavorite(
      cryptocurrency: favorites[index],
      userId: userId,
    ));
  }

  Center _emptyState(String message) {
    return Center(
      child: TextPrimary(
        text: message,
      ),
    );
  }
}

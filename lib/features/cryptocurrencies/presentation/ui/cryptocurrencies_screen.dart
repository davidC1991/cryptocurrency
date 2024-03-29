import 'package:crypto/core/enums/enums_state.dart';
import 'package:crypto/core/enums/price_order_enum.dart';
import 'package:crypto/core/theme/colors/crypto_colors.dart';
import 'package:crypto/core/widgets/texts/text_primary.dart';
import 'package:crypto/core/widgets/toggles/toggle.dart';
import 'package:crypto/features/cryptocurrencies/presentation/bloc/cryptocurrencies_bloc.dart';
import 'package:crypto/features/cryptocurrencies/presentation/controllers/cryptocurrencies_controller.dart';
import 'package:crypto/features/cryptocurrencies/presentation/enums/compare_enum.dart';
import 'package:crypto/features/cryptocurrencies/presentation/ui/widgets/cryptocurrency_card.dart';
import 'package:crypto/features/favorites/presentation/bloc/favorites_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptocurrenciesScreen extends StatelessWidget {
  static const route = 'cryptocurrencies-screen';
  CryptocurrenciesScreen({Key? key}) : super(key: key);
  final CryptocurrenciesController cryptocurrenciesController =
      CryptocurrenciesController();
  @override
  Widget build(BuildContext context) {
    cryptocurrenciesController.context = context;
    return Scaffold(
      backgroundColor: CryptoColors.white,
      floatingActionButton: _orderByPriceToggle(),
      body: _cryptocurrencies(),
    );
  }

  Widget _cryptocurrencies() {
    return BlocConsumer<CryptocurrenciesBloc, CryptocurrenciesState>(
      listener: (context, state) =>
          cryptocurrenciesController.showErrorToast(state, context),
      listenWhen: (previous, current) => current.error != previous.error,
      builder: (context, state) {
        if (BlocStatus.submissionInProgress == state.blocStatus) {
          return const Center(child: CircularProgressIndicator());
        }
        if (BlocStatus.submissionFailure == state.blocStatus) {
          return _emptyState(
              'We have no crypto-currencies to show you, come back later');
        }
        if (state.cryptoCurrenciesFiltered.isNotEmpty) {
          return _showCryptocurrenciesFiltered(state);
        }
        if (state.cryptoCurrenciesFiltered.isEmpty &&
            state.querySearch.isNotEmpty) {
          return _emptyState('No cryptocurrencies were found with that name');
        }
        return _showAllCryptocurrencies(state);
      },
    );
  }

  Widget _showAllCryptocurrencies(CryptocurrenciesState state) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      buildWhen: (previous, current) =>
          previous.favoritesCryptocurrencies !=
          current.favoritesCryptocurrencies,
      builder: (context, favoriteState) {
        return ListView.builder(
            itemCount: state.cryptoCurrencies.length,
            itemBuilder: (context, index) {
              final currentCryptocurrency = state.cryptoCurrencies[index];
              return CryptocurrencyCard(
                name: currentCryptocurrency.name ?? '',
                image: currentCryptocurrency.image ?? '',
                price: currentCryptocurrency.currentPrice.toString(),
                coin: 'USD',
                onPressedCompare: () =>
                    cryptocurrenciesController.compareCryptocurrency(
                        currentCryptocurrency,
                        state.cryptocurrenciesInComparing),
                onPressedFavorite: () => cryptocurrenciesController.putFavorite(
                    currentCryptocurrency,
                    favoriteState.favoritesCryptocurrencies.toList()),
                compareStatus: currentCryptocurrency.statusCompare?.status ??
                    StatusComparingCryptocurrencyEnum.ToCompare.status,
                isFavorite: favoriteState.favoritesCryptocurrencies
                    .toList()
                    .any((element) => element.id == currentCryptocurrency.id),
              );
            });
      },
    );
  }

  ListView _showCryptocurrenciesFiltered(CryptocurrenciesState state) {
    return ListView.builder(
      itemCount: state.cryptoCurrenciesFiltered.length,
      itemBuilder: (context, index) => CryptocurrencyCard(
        name: state.cryptoCurrenciesFiltered[index].name ?? '',
        image: state.cryptoCurrenciesFiltered[index].image ?? '',
        price: state.cryptoCurrenciesFiltered[index].currentPrice.toString(),
        coin: 'USD',
      ),
    );
  }

  Center _emptyState(String message) {
    return Center(
      child: TextPrimary(
        text: message,
      ),
    );
  }

  Toggle _orderByPriceToggle() {
    return Toggle(
      data: {
        PriceOrderEnum.ASC.order: false,
        PriceOrderEnum.DESC.order: true,
      },
      onPressed: (selectedKey) =>
          cryptocurrenciesController.emitOrderByPrice(selectedKey),
    );
  }
}

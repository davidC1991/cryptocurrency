import 'package:crypto/core/responsive/responsive.dart';
import 'package:crypto/core/widgets/texts/text_primary.dart';
import 'package:crypto/features/cryptocurrencies/domain/entity/cryptocurrency.dart';
import 'package:crypto/features/cryptocurrencies/presentation/bloc/cryptocurrencies_bloc.dart';
import 'package:crypto/features/cryptocurrencies/presentation/ui/widgets/cryptocurrency_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptocurrenciesBloc, CryptocurrenciesState>(
      builder: (context, state) {
        if (state.cryptocurrenciesInComparing.isEmpty) {
          return _emptyState('You dont have cryptocurrencies to compare');
        }
        final List<Cryptocurrency> cryptocurrenciesInComparing =
            state.cryptocurrenciesInComparing.toList();
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextPrimary(
              text: 'Compare prices',
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
            Responsive.of(context).spaceSize(5, context),
            _cryptocurrenciesComparison(context, cryptocurrenciesInComparing),
          ],
        );
      },
    );
  }

  Row _cryptocurrenciesComparison(
      BuildContext context, List<Cryptocurrency> cryptocurrenciesInComparing) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: SizedBox(
            height: Responsive.of(context).heightPercent(12),
            child: CryptocurrencyCard(
              name: cryptocurrenciesInComparing[0].name ?? '',
              image: cryptocurrenciesInComparing[0].image ?? '',
              price: cryptocurrenciesInComparing[0].currentPrice.toString(),
              coin: 'USD',
            ),
          ),
        ),
        if (cryptocurrenciesInComparing.length == 1)
          Expanded(
            child: SizedBox(
              height: Responsive.of(context).heightPercent(12),
              child: const CryptocurrencyCard(
                name: 'Missing',
                image: 'https://www.namepros.com/attachments/empty-png.89209/',
                price: '0.0',
                coin: 'USD',
              ),
            ),
          )
        else
          Expanded(
            child: SizedBox(
              height: Responsive.of(context).heightPercent(12),
              child: CryptocurrencyCard(
                name: cryptocurrenciesInComparing[1].name ?? '',
                image: cryptocurrenciesInComparing[1].image ?? '',
                price: cryptocurrenciesInComparing[1].currentPrice.toString(),
                coin: 'USD',
              ),
            ),
          )
      ],
    );
  }

  Center _emptyState(String message) {
    return Center(
      child: TextPrimary(
        text: message,
      ),
    );
  }
}

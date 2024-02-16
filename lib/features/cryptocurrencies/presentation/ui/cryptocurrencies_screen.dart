import 'package:crypto/core/enums/enums_state.dart';
import 'package:crypto/core/widgets/avatars/circle_avatars.dart';
import 'package:crypto/core/widgets/text/text_primary.dart';
import 'package:crypto/features/cryptocurrencies/presentation/bloc/cryptocurrencies_bloc.dart';
import 'package:crypto/features/cryptocurrencies/presentation/controllers/cryptocurrencies_controller.dart';

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
    BlocProvider.of<CryptocurrenciesBloc>(context)
        .add(const GetCryptocurrencies());
    return Scaffold(
      appBar: AppBar(title: Text('crypto')),
      body: BlocConsumer<CryptocurrenciesBloc, CryptocurrenciesState>(
        listener: (context, state) =>
            cryptocurrenciesController.showErrorToast(state, context),
        listenWhen: (previous, current) => current.error != previous.error,
        buildWhen: (previous, current) =>
            current.blocStatus != previous.blocStatus,
        builder: (context, state) {
          if (BlocStatus.submissionInProgress == state.blocStatus) {
            return const Center(child: const CircularProgressIndicator());
          }
          if (BlocStatus.submissionFailure == state.blocStatus) {
            return _emptyState();
          }
          return ListView.builder(
            itemCount: state.cryptoCurrencies.length,
            itemBuilder: (context, index) => _cryptocurrencyCard(state, index),
          );
        },
      ),
    );
  }

  Widget _cryptocurrencyCard(CryptocurrenciesState state, int index) {
    return Card(
      child: ListTile(
        leading: Avatars.circle(cryptocurrenciesController.context,
            state.cryptoCurrencies[index].image ?? ''),
        title: TextPrimary(
          text: state.cryptoCurrencies[index].name ?? '',
          fontWeight: FontWeight.w600,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
        subtitle: TextPrimary(
          text: state.cryptoCurrencies[index].currentPrice.toString(),
          fontWeight: FontWeight.w600,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Center _emptyState() {
    return const Center(
      child: TextPrimary(
        text: 'No se encontraron criptomonedas',
      ),
    );
  }
}

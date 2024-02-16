import 'package:crypto/features/cryptocurrencies/presentation/controllers/cryptocurrencies_controller.dart';
import 'package:crypto/features/cryptocurrencies/presentation/cubit/cryptocurrencies_cubit.dart';
import 'package:crypto/features/cryptocurrencies/presentation/cubit/cryptocurrencies_state.dart';
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
      appBar: AppBar(title: Text('crypto')),
      body: BlocConsumer<CryptocurrenciesCubit, CryptocurrenciesState>(
        listener: (context, state) =>
            cryptocurrenciesController.showErrorToast(state, context),
        listenWhen: (previous, current) => current.error != previous.error,
        buildWhen: (previous, current) =>
            current.blocStatus == previous.blocStatus,
        builder: (context, state) => const SizedBox.shrink(),
      ),
    );
  }
}

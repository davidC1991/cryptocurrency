import 'package:crypto/core/dialogs/dialogs.dart';
import 'package:crypto/core/enums/enums_state.dart';
import 'package:crypto/core/enums/price_order_enum.dart';
import 'package:crypto/core/toasts/toast.dart';
import 'package:crypto/features/cryptocurrencies/domain/entity/cryptocurrency.dart';
import 'package:crypto/features/cryptocurrencies/presentation/bloc/cryptocurrencies_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptocurrenciesController {
  late BuildContext context;

  void showErrorToast(CryptocurrenciesState state, BuildContext context) {
    if (state.blocStatus == BlocStatus.submissionFailure) {
      ToastCrypto.errorToast(state.error);
      BlocProvider.of<CryptocurrenciesBloc>(context)
          .add(const ResetCryptocurrencies());
    }
  }

  void emitOrderByPrice(String selectedKey) {
    final PriceOrderEnum selectedOrder = PriceOrderEnum.fromString(selectedKey);
    BlocProvider.of<CryptocurrenciesBloc>(context)
        .add(ChangeOrderCryptocurrency(selectedOrder));
  }

  void compareCryptocurrency(Cryptocurrency cryptocurrency,
      Set<Cryptocurrency> cryptocurrenciesInComparing) {
    if (cryptocurrenciesInComparing.length == 2) {
      DialogCrypto.showConfirmDialog(
        context,
        '',
        'You already have two currencies selected to compare, do you want to clear your options?',
        'OK',
        'Cancel',
        () => BlocProvider.of<CryptocurrenciesBloc>(context)
            .add(const CleanCryptocurrencyInComparing()),
        () => {},
      );
      return;
    }
    BlocProvider.of<CryptocurrenciesBloc>(context)
        .add(CompareCryptocurrencies(cryptocurrency));
    if (cryptocurrenciesInComparing.isEmpty) {
      ToastCrypto.validationMessageToast(
          'Chose other cryptocurrency', false, context);
    }
  }
}

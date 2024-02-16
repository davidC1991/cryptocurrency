import 'package:crypto/core/enums/enums_state.dart';
import 'package:crypto/core/toasts/toast.dart';
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
}

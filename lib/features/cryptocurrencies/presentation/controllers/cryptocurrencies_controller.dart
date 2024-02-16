import 'package:crypto/core/enums/enums_state.dart';
import 'package:crypto/core/toasts/toast.dart';
import 'package:crypto/features/cryptocurrencies/presentation/cubit/cryptocurrencies_cubit.dart';
import 'package:crypto/features/cryptocurrencies/presentation/cubit/cryptocurrencies_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptocurrenciesController {
  late BuildContext context;

  void init(BuildContext context) {
    //TODO: WHATEVER THING THAT YOU WANT TO INITIALIZE
  }

  void dispose() {
    //TODO: DELETE IF IT NOT NECESSARY
  }

  showErrorToast(CryptocurrenciesState state, BuildContext context) {
    if (state.blocStatus == BlocStatus.submissionFailure) {
      ToastCrypto.errorToast(state.error);
      BlocProvider.of<CryptocurrenciesCubit>(context).resetBlocStatus();
    }
  }
}

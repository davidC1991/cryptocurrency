import 'package:crypto/features/cryptocurrencies/presentation/bloc/cryptocurrencies_bloc.dart';
import 'package:crypto/features/login/presentation/bloc/login_bloc.dart';
import 'package:crypto/features/login/presentation/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeController {
  late BuildContext context;
  PageController pageController = PageController(initialPage: 0);
  final _debouncer =
      Debouncer<String>(const Duration(seconds: 1), initialValue: '');
  TextEditingController textEditingController = TextEditingController();
  ValueNotifier<int> currentIndexNotifier = ValueNotifier(0);
  void searchListener() {
    textEditingController.addListener(() {
      _debouncer.value = textEditingController.text;
    });

    _debouncer.values.listen((search) {
      if (search.isNotEmpty) {
        BlocProvider.of<CryptocurrenciesBloc>(context)
            .add(GetCryptocurrencyByName(query: search));
      } else {
        BlocProvider.of<CryptocurrenciesBloc>(context)
            .add(const CleanCryptocurrencySearch());
      }
    });
  }

  void jumpToPage(int pageIndex) {
    currentIndexNotifier.value = pageIndex;
    pageController.jumpToPage(pageIndex);
  }

  void logOut() {
    BlocProvider.of<LoginBloc>(context).add(const ResetLogin());
    Navigator.pushNamedAndRemoveUntil(
        context, LoginScreen.route, (route) => false);
  }
}

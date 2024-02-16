import 'package:crypto/features/cryptocurrencies/presentation/ui/cryptocurrencies_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> cryptoManagerRoutes = {
    CryptocurrenciesScreen.route: (context) => CryptocurrenciesScreen(),
  };
}

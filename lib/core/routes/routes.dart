import 'package:crypto/features/cryptocurrencies/presentation/ui/cryptocurrencies_screen.dart';
import 'package:crypto/features/home/presentation/ui/home_screem.dart';
import 'package:crypto/features/login/presentation/ui/login_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> cryptoManagerRoutes = {
    CryptocurrenciesScreen.route: (context) => CryptocurrenciesScreen(),
    HomeScreen.route: (context) => HomeScreen(),
    LoginScreen.route: (context) => LoginScreen(),
  };
}

import 'package:crypto/core/routes/routes.dart';
import 'package:crypto/features/cryptocurrencies/presentation/bloc/cryptocurrencies_bloc.dart';
import 'package:crypto/features/home/presentation/home_screem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/independencyInjection/injection_container.dart';

void main() async {
  await dependenciesInitialization();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('🥶main');
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<CryptocurrenciesBloc>())
      ],
      child: MaterialApp(
        routes: Routes.cryptoManagerRoutes,
        initialRoute: HomeScreen.route,
      ),
    );
  }
}

import 'package:crypto/core/routes/routes.dart';
import 'package:crypto/features/cryptocurrencies/presentation/cubit/cryptocurrencies_cubit.dart';
import 'package:crypto/features/cryptocurrencies/presentation/ui/cryptocurrencies_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/independencyInjection/injection_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<CryptocurrenciesCubit>())
      ],
      child: MaterialApp(
        routes: Routes.cryptoManagerRoutes,
        initialRoute: CryptocurrenciesScreen.route,
      ),
    );
  }
}

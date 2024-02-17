import 'package:crypto/core/routes/routes.dart';
import 'package:crypto/features/cryptocurrencies/presentation/bloc/cryptocurrencies_bloc.dart';
import 'package:crypto/features/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:crypto/features/login/presentation/bloc/login_bloc.dart';
import 'package:crypto/features/login/presentation/ui/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/independencyInjection/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dependenciesInitialization();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<CryptocurrenciesBloc>()),
        BlocProvider(create: (context) => getIt<LoginBloc>()),
        BlocProvider(create: (context) => getIt<FavoritesBloc>())
      ],
      child: MaterialApp(
        routes: Routes.cryptoManagerRoutes,
        initialRoute: LoginScreen.route,
      ),
    );
  }
}

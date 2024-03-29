import 'package:crypto/core/third_party_package/firebase/firebase_repository.dart';
import 'package:crypto/core/third_party_package/http/http_repository.dart';
import 'package:crypto/features/cryptocurrencies/data/datasource/cryptocurrency_datasource.dart';
import 'package:crypto/features/cryptocurrencies/data/repository/cryptocurrency_datasource_impl.dart';
import 'package:crypto/features/cryptocurrencies/domain/repository/cryptocurrency_repository.dart';
import 'package:crypto/features/cryptocurrencies/domain/usecases/cryptocurrency.dart';
import 'package:crypto/features/cryptocurrencies/presentation/bloc/cryptocurrencies_bloc.dart';
import 'package:crypto/features/favorites/data/data_sources/favorites_datasource.dart';
import 'package:crypto/features/favorites/data/repository/favorite_datasource_impl.dart';
import 'package:crypto/features/favorites/domain/repository/favorite_repository.dart';
import 'package:crypto/features/favorites/domain/usecases/favorites.dart';
import 'package:crypto/features/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:crypto/features/login/data/datasource/user_datasource.dart';
import 'package:crypto/features/login/data/repository/user_datasource_impl.dart';
import 'package:crypto/features/login/domain/repository/auth_repository.dart';
import 'package:crypto/features/login/domain/usecases/auth.dart';
import 'package:crypto/features/login/presentation/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> dependenciesInitialization() async {
  await login();
  await cryptoCurrencies();
  await favorites();
}

Future<void> cryptoCurrencies() async {
  getIt.registerFactory(() => CryptocurrenciesBloc(getIt()));

  getIt.registerLazySingleton(() => CryptocurrenciesUseCase(getIt()));
  getIt.registerLazySingleton<CryptocurrencyRepository>(
      () => CryptocurrencyDataSourceImpl(getIt()));
  getIt.registerLazySingleton<CryptocurrencyDataSourceRepository>(
      () => CryptocurrencyDataSourceWithCoingecko(CustomeHttpClient()));
}

Future<void> login() async {
  getIt.registerFactory(() => LoginBloc(getIt()));

  getIt.registerLazySingleton(() => Auth(getIt()));
  getIt
      .registerLazySingleton<AuthRepository>(() => AuthDataSourceImpl(getIt()));
  getIt.registerLazySingleton<AuthDataSourceRepository>(
      () => AuthDataSourceFirebaseProvider(FirebaseAsProvider()));
}

Future<void> favorites() async {
  getIt.registerFactory(() => FavoritesBloc(getIt()));

  getIt.registerLazySingleton(() => Favorites(getIt()));
  getIt.registerLazySingleton<FavoriteRepository>(
      () => FavoriteDataSourceImpl(getIt()));
  getIt.registerLazySingleton<FavoriteDataSourceRepository>(
      () => FavoriteDataSourceFirebaseProvider(FirebaseAsProvider()));
}

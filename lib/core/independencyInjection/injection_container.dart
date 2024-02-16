import 'package:crypto/features/cryptocurrencies/data/datasource/cryptocurrency_datasource.dart';
import 'package:crypto/features/cryptocurrencies/data/repository/cryptocurrency_datasource_impl.dart';
import 'package:crypto/features/cryptocurrencies/domain/repository/cryptocurrency_repository.dart';
import 'package:crypto/features/cryptocurrencies/domain/usecases/cryptocurrency.dart';
import 'package:crypto/features/cryptocurrencies/presentation/cubit/cryptocurrencies_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  await cryptoCurrencies();
}

Future<void> cryptoCurrencies() async {
  getIt.registerFactory(() => CryptocurrenciesCubit(getIt()));

  getIt.registerLazySingleton(() => Cryptocurrency(getIt()));
  getIt.registerLazySingleton<CryptocurrencyRepository>(
      () => CryptocurrencyDataSourceImpl(getIt()));
  getIt.registerLazySingleton<CryptocurrencyDataSourceRepository>(
      () => CryptocurrencyDataSourceWith());
}

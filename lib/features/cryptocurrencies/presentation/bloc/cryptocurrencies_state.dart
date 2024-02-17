part of 'cryptocurrencies_bloc.dart';

// ignore: must_be_immutable
class CryptocurrenciesState extends Equatable {
  CryptocurrenciesState({
    this.blocStatus = BlocStatus.noSubmitted,
    this.error = '',
    this.cryptoCurrencies = const [],
    this.cryptoCurrenciesFiltered = const [],
    this.querySearch = '',
    this.cryptocurrenciesInComparing = const {},
  });

  final BlocStatus blocStatus;
  final String error;
  final String querySearch;

  List<Cryptocurrency> cryptoCurrencies;
  final List<Cryptocurrency> cryptoCurrenciesFiltered;
  Set<Cryptocurrency> cryptocurrenciesInComparing;

  CryptocurrenciesState copyWith({
    BlocStatus? blocStatus,
    String? error,
    String? nameZone,
    String? querySearch,
    List<Cryptocurrency>? cryptoCurrencies,
    List<Cryptocurrency>? cryptoCurrenciesFiltered,
    Set<Cryptocurrency>? cryptocurrenciesInComparing,
  }) =>
      CryptocurrenciesState(
        blocStatus: blocStatus ?? this.blocStatus,
        error: error ?? this.error,
        cryptoCurrencies: cryptoCurrencies ?? this.cryptoCurrencies,
        cryptoCurrenciesFiltered:
            cryptoCurrenciesFiltered ?? this.cryptoCurrenciesFiltered,
        querySearch: querySearch ?? this.querySearch,
        cryptocurrenciesInComparing:
            cryptocurrenciesInComparing ?? this.cryptocurrenciesInComparing,
      );

  List<Cryptocurrency> filterByQuery(String query) {
    return cryptoCurrencies
        .where((cryptoCurrency) => (cryptoCurrency.name ?? '')
            .toLowerCase()
            .contains(query.toLowerCase()))
        .toList();
  }

  List<Cryptocurrency> changeCompareStatus(
      Cryptocurrency selectedCryptocurrency) {
    return cryptoCurrencies.map((cryptocurrency) {
      if (cryptocurrency.statusCompare ==
          StatusComparingCryptocurrencyEnum.Comparing) {
        return cryptocurrency;
      }

      if (cryptocurrency.id == selectedCryptocurrency.id) {
        cryptocurrency.statusCompare =
            StatusComparingCryptocurrencyEnum.Comparing;
        return cryptocurrency;
      }
      cryptocurrency.statusCompare =
          StatusComparingCryptocurrencyEnum.CompareWith;
      return cryptocurrency;
    }).toList();
  }

  List<Cryptocurrency> cleanCryptocurrencyInComparing() {
    return cryptoCurrencies.map((cryptocurrency) {
      cryptocurrency.statusCompare =
          StatusComparingCryptocurrencyEnum.ToCompare;

      return cryptocurrency;
    }).toList();
  }

  List<Cryptocurrency> orderByPrice(
      PriceOrderEnum priceOrder, List<Cryptocurrency> cryptoCurrencies) {
    List<Cryptocurrency> mutableList = List.from(cryptoCurrencies);

    mutableList.sort((a, b) {
      if (priceOrder == PriceOrderEnum.DESC) {
        return b.currentPrice!.compareTo(a.currentPrice!);
      } else {
        return a.currentPrice!.compareTo(b.currentPrice!);
      }
    });

    return mutableList;
  }

  @override
  List<Object> get props => [
        blocStatus,
        error,
        querySearch,
        cryptoCurrencies,
        cryptoCurrenciesFiltered,
        cryptocurrenciesInComparing,
      ];
}

// ignore: must_be_immutable
class CryptocurrenciesInitial extends CryptocurrenciesState {
  CryptocurrenciesInitial()
      : super(
          blocStatus: BlocStatus.noSubmitted,
          cryptoCurrencies: const [],
          cryptoCurrenciesFiltered: const [],
          error: '',
          querySearch: '',
          cryptocurrenciesInComparing: const {},
        );
}

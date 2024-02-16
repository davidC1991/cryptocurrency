part of 'cryptocurrencies_bloc.dart';

class CryptocurrenciesState extends Equatable {
  const CryptocurrenciesState({
    this.blocStatus = BlocStatus.noSubmitted,
    this.error = '',
    this.cryptoCurrencies = const [],
  });

  final BlocStatus blocStatus;
  final String error;
  final List<Cryptocurrency> cryptoCurrencies;

  CryptocurrenciesState copyWith({
    BlocStatus? blocStatus,
    String? error,
    String? nameZone,
    List<Cryptocurrency>? cryptoCurrencies,
  }) =>
      CryptocurrenciesState(
        blocStatus: blocStatus ?? this.blocStatus,
        error: error ?? this.error,
        cryptoCurrencies: cryptoCurrencies ?? this.cryptoCurrencies,
      );

  @override
  List<Object> get props => [
        blocStatus,
        error,
        cryptoCurrencies,
      ];
}

class CryptocurrenciesInitial extends CryptocurrenciesState {
  const CryptocurrenciesInitial()
      : super(
          blocStatus: BlocStatus.noSubmitted,
          cryptoCurrencies: const [],
          error: '',
        );
}

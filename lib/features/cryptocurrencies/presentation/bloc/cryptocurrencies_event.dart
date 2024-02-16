part of 'cryptocurrencies_bloc.dart';

sealed class CryptocurrenciesEvent extends Equatable {
  const CryptocurrenciesEvent();

  @override
  List<Object> get props => [];
}

class GetCryptocurrencies extends CryptocurrenciesEvent {
  const GetCryptocurrencies();
}

class ResetCryptocurrencies extends CryptocurrenciesEvent {
  const ResetCryptocurrencies();
}

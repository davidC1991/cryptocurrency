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

class GetCryptocurrencyByName extends CryptocurrenciesEvent {
  final String? query;
  const GetCryptocurrencyByName({this.query});
}

class CleanCryptocurrencySearch extends CryptocurrenciesEvent {
  const CleanCryptocurrencySearch();
}

class ChangeOrderCryptocurrency extends CryptocurrenciesEvent {
  final PriceOrderEnum priceOrder;
  const ChangeOrderCryptocurrency(this.priceOrder);
}

class CompareCryptocurrencies extends CryptocurrenciesEvent {
  final Cryptocurrency cryptocurrenciesToComparing;
  const CompareCryptocurrencies(this.cryptocurrenciesToComparing);
}

class CleanCryptocurrencyInComparing extends CryptocurrenciesEvent {
  const CleanCryptocurrencyInComparing();
}

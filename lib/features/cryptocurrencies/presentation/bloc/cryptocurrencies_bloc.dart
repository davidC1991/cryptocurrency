import 'package:bloc/bloc.dart';
import 'package:crypto/core/enums/enums_state.dart';
import 'package:crypto/core/enums/price_order_enum.dart';
import 'package:crypto/features/cryptocurrencies/domain/entity/cryptocurrency.dart';
import 'package:crypto/features/cryptocurrencies/domain/usecases/cryptocurrency.dart';
import 'package:crypto/features/cryptocurrencies/presentation/enums/compare_enum.dart';
import 'package:equatable/equatable.dart';

part 'cryptocurrencies_event.dart';
part 'cryptocurrencies_state.dart';

class CryptocurrenciesBloc
    extends Bloc<CryptocurrenciesEvent, CryptocurrenciesState> {
  CryptocurrenciesBloc(Cryptocurrencies cryptocurrencies)
      : _cryptocurrencies = cryptocurrencies,
        super(CryptocurrenciesInitial()) {
    on<CryptocurrenciesEvent>((event, emit) {
      if (event is GetCryptocurrencies) {
        _getCryptocurrencies();
        return;
      }
      if (event is ResetCryptocurrencies) {
        emit(CryptocurrenciesInitial());
        return;
      }
      if (event is CleanCryptocurrencySearch) {
        emit(state.copyWith(querySearch: '', cryptoCurrenciesFiltered: []));
        return;
      }
      if (event is GetCryptocurrencyByName) {
        emit(state.copyWith(
          querySearch: event.query,
          cryptoCurrenciesFiltered: state.filterByQuery(event.query ?? ''),
        ));
        return;
      }
      if (event is ChangeOrderCryptocurrency) {
        emit(state.copyWith(
            cryptoCurrencies:
                state.orderByPrice(event.priceOrder, state.cryptoCurrencies)));
        return;
      }
      if (event is CompareCryptocurrencies) {
        _emitCryptocurrenciesInComparing(event);
        return;
      }
      if (event is CleanCryptocurrencyInComparing) {
        _cleanCryptocurrenciesInComparing();
        return;
      }
    });
  }
  final Cryptocurrencies _cryptocurrencies;

  void _getCryptocurrencies({
    PriceOrderEnum priceOrder = PriceOrderEnum.DESC,
  }) async {
    emit(state.copyWith(blocStatus: BlocStatus.submissionInProgress));
    final cryptoCurrencies = await _cryptocurrencies();
    cryptoCurrencies.fold(
      (error) => emit(_error(error)),
      (cryptoCurrencies) => emit(state.copyWith(
          blocStatus: BlocStatus.submissionSuccess,
          cryptoCurrencies: state.orderByPrice(priceOrder, cryptoCurrencies))),
    );
  }

  void _emitCryptocurrenciesInComparing(CompareCryptocurrencies event) {
    if ((state.cryptocurrenciesInComparing).length == 2) return;
    Set<Cryptocurrency> updatedSet =
        Set.from(state.cryptocurrenciesInComparing);
    updatedSet.add(event.cryptocurrenciesToComparing);
    emit(state.copyWith(
      cryptoCurrencies:
          state.changeCompareStatus(event.cryptocurrenciesToComparing),
      cryptocurrenciesInComparing: updatedSet,
    ));
  }

  void _cleanCryptocurrenciesInComparing() {
    emit(state.copyWith(
      cryptoCurrencies: state.cleanCryptocurrencyInComparing(),
      cryptocurrenciesInComparing: {},
    ));
  }

  CryptocurrenciesState _error(String error) =>
      state.copyWith(error: error, blocStatus: BlocStatus.submissionFailure);
}

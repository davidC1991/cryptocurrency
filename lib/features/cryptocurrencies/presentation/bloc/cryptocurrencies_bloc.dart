import 'package:bloc/bloc.dart';
import 'package:crypto/core/enums/enums_state.dart';
import 'package:crypto/features/cryptocurrencies/domain/entity/cryptocurrency.dart';
import 'package:crypto/features/cryptocurrencies/domain/usecases/cryptocurrency.dart';
import 'package:equatable/equatable.dart';

part 'cryptocurrencies_event.dart';
part 'cryptocurrencies_state.dart';

class CryptocurrenciesBloc
    extends Bloc<CryptocurrenciesEvent, CryptocurrenciesState> {
  CryptocurrenciesBloc(Cryptocurrencies cryptocurrencies)
      : _cryptocurrencies = cryptocurrencies,
        super(const CryptocurrenciesInitial()) {
    on<CryptocurrenciesEvent>((event, emit) {
      if (event is GetCryptocurrencies) {
        _getCryptocurrencies();
        return;
      }
      if (event is GetCryptocurrencies) {
        _reset();
        return;
      }
    });
  }
  final Cryptocurrencies _cryptocurrencies;

  void _getCryptocurrencies() async {
    emit(state.copyWith(blocStatus: BlocStatus.submissionInProgress));
    final cryptoCurrencies = await _cryptocurrencies();
    cryptoCurrencies.fold(
      (error) => emit(_error(error)),
      (cryptoCurrencies) => emit(state.copyWith(
          blocStatus: BlocStatus.submissionSuccess,
          cryptoCurrencies: cryptoCurrencies)),
    );
  }

  CryptocurrenciesState _error(String error) =>
      state.copyWith(error: error, blocStatus: BlocStatus.submissionFailure);

  void _reset() => emit(const CryptocurrenciesInitial());
}

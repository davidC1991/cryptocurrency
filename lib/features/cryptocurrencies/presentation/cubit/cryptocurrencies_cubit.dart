import 'package:bloc/bloc.dart';
import 'package:crypto/core/enums/enums_state.dart';
import 'package:crypto/features/cryptocurrencies/domain/usecases/cryptocurrency.dart';
import 'package:crypto/features/cryptocurrencies/presentation/cubit/cryptocurrencies_state.dart';

//TODO: ADD BLOC TO WIDGETS TREE IN MAIN FILE
class CryptocurrenciesCubit extends Cubit<CryptocurrenciesState> {
  CryptocurrenciesCubit(Cryptocurrency cryptocurrency)
      : _cryptocurrency = cryptocurrency,
        super(CryptocurrenciesInitial());

  Cryptocurrency _cryptocurrency;

  getCryptocurrencies() async {
    emit(state.copyWith(blocStatus: BlocStatus.submissionInProgress));
    final response = await _cryptocurrency();

    response.fold(
      (error) => emit(_error(error)),
      (response) => emit(state.copyWith(response: [response])),
    );
  }

  _error(String error) =>
      state.copyWith(error: error, blocStatus: BlocStatus.submissionFailure);

  resetStatus() {
    emit(CryptocurrenciesInitial());
  }

  resetBlocStatus() {
    emit(state.copyWith(blocStatus: BlocStatus.noSubmitted, error: ''));
  }
}

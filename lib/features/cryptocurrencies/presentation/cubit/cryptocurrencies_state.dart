import 'package:crypto/core/enums/enums_state.dart';
import 'package:crypto/features/cryptocurrencies/domain/entity/cryptocurrency.dart';
import 'package:equatable/equatable.dart';

class CryptocurrenciesState extends Equatable {
  const CryptocurrenciesState({
    this.blocStatus = BlocStatus.noSubmitted,
    this.error = '',
    this.response = const [],
  });

  final BlocStatus blocStatus;
  final String error;
  final List<CryptocurrencyEntity> response;

  CryptocurrenciesState copyWith({
    BlocStatus? blocStatus,
    String? error,
    String? nameZone,
    List<CryptocurrencyEntity>? response,
  }) =>
      CryptocurrenciesState(
        blocStatus: blocStatus ?? this.blocStatus,
        error: error ?? this.error,
        response: response ?? this.response,
      );

  @override
  List<Object> get props => [
        blocStatus,
        error,
        response,
      ];
}

class CryptocurrenciesInitial extends CryptocurrenciesState {
  const CryptocurrenciesInitial()
      : super(
          blocStatus: BlocStatus.noSubmitted,
          response: const [],
          error: '',
        );
}

enum CryptocurrenciesProcessState {
  //TODO: PUT IN THE PROCESS STATE NAME OF FLOW
  init
}

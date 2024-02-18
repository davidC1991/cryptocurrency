import 'package:bloc_test/bloc_test.dart';
import 'package:crypto/core/enums/enums_state.dart';
import 'package:crypto/features/cryptocurrencies/presentation/bloc/cryptocurrencies_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helper/dummy_cryptocurrencies/dummy_models.dart';
import '../../../../helper/mocks.dart';

void main() {
  MockCryptocurrenciesUseCase mockCryptocurrenciesUseCase =
      MockCryptocurrenciesUseCase();
  CryptocurrenciesBloc cryptocurrenciesBloc =
      CryptocurrenciesBloc(mockCryptocurrenciesUseCase);

  test('Initial state should be empty', () {
    expect(cryptocurrenciesBloc.state, CryptocurrenciesInitial());
  });

  blocTest<CryptocurrenciesBloc, CryptocurrenciesState>(
    'emits cryptocurrencies',
    build: () {
      when(() => mockCryptocurrenciesUseCase())
          .thenAnswer((invocation) async => Right(cryptocurrencies_));
      return cryptocurrenciesBloc;
    },
    act: (bloc) => bloc.add(const GetCryptocurrencies()),
    expect: () => <CryptocurrenciesState>[
      CryptocurrenciesState(blocStatus: BlocStatus.submissionInProgress),
      CryptocurrenciesState(
          blocStatus: BlocStatus.submissionSuccess,
          cryptoCurrencies: cryptocurrencies_),
    ],
  );
  blocTest<CryptocurrenciesBloc, CryptocurrenciesState>(
    'emits error message when try to get cryptocurrencies',
    build: () {
      when(() => mockCryptocurrenciesUseCase()).thenAnswer(
          (invocation) async => const Left('Error to get cryptocurrencies'));
      return cryptocurrenciesBloc;
    },
    act: (bloc) => bloc.add(const GetCryptocurrencies()),
    expect: () => <CryptocurrenciesState>[
      CryptocurrenciesState(blocStatus: BlocStatus.submissionInProgress),
      CryptocurrenciesState(
          blocStatus: BlocStatus.submissionFailure,
          error: 'Error to get cryptocurrencies'),
    ],
  );
}

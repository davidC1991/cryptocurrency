import 'package:bloc_test/bloc_test.dart';
import 'package:crypto/core/enums/enums_state.dart';
import 'package:crypto/core/enums/price_order_enum.dart';
import 'package:crypto/features/cryptocurrencies/presentation/bloc/cryptocurrencies_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helper/dummy_cryptocurrencies/dummy_models.dart';
import '../../../../helper/mocks.dart';

void main() {
  late MockCryptocurrenciesUseCase mockCryptocurrenciesUseCase;
  late CryptocurrenciesBloc cryptocurrenciesBloc;

  setUp(() {
    mockCryptocurrenciesUseCase = MockCryptocurrenciesUseCase();
    cryptocurrenciesBloc = CryptocurrenciesBloc(mockCryptocurrenciesUseCase);
  });
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
  blocTest<CryptocurrenciesBloc, CryptocurrenciesState>(
    'Reset cryptocurrencies',
    build: () => cryptocurrenciesBloc,
    act: (bloc) => bloc.add(const ResetCryptocurrencies()),
    expect: () => <CryptocurrenciesState>[
      CryptocurrenciesInitial(),
    ],
  );
  blocTest<CryptocurrenciesBloc, CryptocurrenciesState>(
    'Clean filtered cryptocurrencies',
    build: () => cryptocurrenciesBloc,
    act: (bloc) => bloc.add(const CleanCryptocurrencySearch()),
    expect: () => <CryptocurrenciesState>[
      CryptocurrenciesState(querySearch: ''),
    ],
  );
  blocTest<CryptocurrenciesBloc, CryptocurrenciesState>(
    'Get cryptocurrencies by name',
    build: () => cryptocurrenciesBloc,
    act: (bloc) => bloc.add(const GetCryptocurrencyByName(query: 'any')),
    expect: () => <CryptocurrenciesState>[
      CryptocurrenciesState(querySearch: 'any'),
    ],
  );
  blocTest<CryptocurrenciesBloc, CryptocurrenciesState>(
    'Change order cryptocurrencies',
    //build: () => cryptocurrenciesBloc,
    build: () {
      when(() => mockCryptocurrenciesUseCase())
          .thenAnswer((invocation) async => Right(cryptocurrencies_));
      return cryptocurrenciesBloc;
    },
    act: (bloc) {
      bloc.add(const GetCryptocurrencies());
      bloc.add(const ChangeOrderCryptocurrency(PriceOrderEnum.DESC));
    },
    expect: () => <CryptocurrenciesState>[
      CryptocurrenciesState(blocStatus: BlocStatus.submissionInProgress),
      CryptocurrenciesState(
          blocStatus: BlocStatus.submissionSuccess,
          cryptoCurrencies: cryptocurrencies_),
    ],
  );
  blocTest<CryptocurrenciesBloc, CryptocurrenciesState>(
    'Compare cryptocurrencies',
    //build: () => cryptocurrenciesBloc,
    build: () {
      when(() => mockCryptocurrenciesUseCase())
          .thenAnswer((invocation) async => Right(cryptocurrencies_));
      return cryptocurrenciesBloc;
    },
    act: (bloc) {
      bloc.add(const GetCryptocurrencies());
      bloc.add(CompareCryptocurrencies(cryptocurrencies_[0]));
    },
    expect: () => <CryptocurrenciesState>[
      CryptocurrenciesState(blocStatus: BlocStatus.submissionInProgress),
      CryptocurrenciesState(
          blocStatus: BlocStatus.submissionSuccess,
          cryptoCurrencies: cryptocurrencies_),
      CryptocurrenciesState(
          blocStatus: BlocStatus.submissionSuccess,
          cryptoCurrencies: cryptocurrencies_,
          cryptocurrenciesInComparing: cryptocurrencies_.toSet()),
    ],
  );
  blocTest<CryptocurrenciesBloc, CryptocurrenciesState>(
    'Clean cryptocurrencies in comparing',
    build: () {
      when(() => mockCryptocurrenciesUseCase())
          .thenAnswer((invocation) async => Right(cryptocurrencies_));
      return cryptocurrenciesBloc;
    },
    act: (bloc) {
      bloc.add(const GetCryptocurrencies());
      bloc.add(const CleanCryptocurrencyInComparing());
    },
    expect: () => <CryptocurrenciesState>[
      CryptocurrenciesState(blocStatus: BlocStatus.submissionInProgress),
      CryptocurrenciesState(
          blocStatus: BlocStatus.submissionSuccess,
          cryptoCurrencies: cryptocurrencies_),
    ],
  );
}

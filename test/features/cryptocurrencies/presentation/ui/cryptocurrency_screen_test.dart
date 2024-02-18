import 'package:bloc_test/bloc_test.dart';
import 'package:crypto/core/const%20/test_helper.dart';
import 'package:crypto/core/enums/enums_state.dart';
import 'package:crypto/features/cryptocurrencies/presentation/bloc/cryptocurrencies_bloc.dart';
import 'package:crypto/features/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:crypto/features/home/presentation/ui/home_screem.dart';
import 'package:crypto/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helper/dummy_cryptocurrencies/dummy_models.dart';

class MockCryptocurrenciesBloc
    extends MockBloc<CryptocurrenciesEvent, CryptocurrenciesState>
    implements CryptocurrenciesBloc {}

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

class MockFavoritesBloc extends MockBloc<FavoritesEvent, FavoritesState>
    implements FavoritesBloc {}

void main() {
  late MockCryptocurrenciesBloc mockCryptocurrenciesBloc;
  late MockLoginBloc mockLoginBloc;
  late MockFavoritesBloc mockFavoritesBloc;
  isTest = true;
  setUp(() {
    mockCryptocurrenciesBloc = MockCryptocurrenciesBloc();
    mockLoginBloc = MockLoginBloc();
    mockFavoritesBloc = MockFavoritesBloc();
  });

  Widget makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CryptocurrenciesBloc>(
            create: (context) => mockCryptocurrenciesBloc),
        BlocProvider<LoginBloc>(create: (context) => mockLoginBloc),
        BlocProvider<FavoritesBloc>(create: (context) => mockFavoritesBloc),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('There is not available cryptocurrencies ', (widgetTester) async {
    when(() => mockLoginBloc.state).thenReturn(const LoginState(userId: 'any'));
    when(() => mockCryptocurrenciesBloc.state).thenReturn(
        CryptocurrenciesState(blocStatus: BlocStatus.submissionFailure));
    when(() => mockFavoritesBloc.state).thenReturn(FavoritesInitial());

    await widgetTester.pumpWidget(makeTestableWidget(HomeScreen()));
    final textField = find.byType(TextField);
    expect(textField, findsOneWidget);
    final emptyMessage =
        find.text('We have no crypto-currencies to show you, come back later');
    expect(emptyMessage, findsOneWidget);
  });
  testWidgets('Cryptocurrencies call in progress ', (widgetTester) async {
    when(() => mockLoginBloc.state).thenReturn(const LoginState(userId: 'any'));
    when(() => mockCryptocurrenciesBloc.state).thenReturn(
        CryptocurrenciesState(blocStatus: BlocStatus.submissionInProgress));
    when(() => mockFavoritesBloc.state).thenReturn(FavoritesInitial());

    await widgetTester.pumpWidget(makeTestableWidget(HomeScreen()));
    final loading = find.byType(CircularProgressIndicator);
    expect(loading, findsOneWidget);
  });
  testWidgets('Empty cryptocurrencies searching', (widgetTester) async {
    when(() => mockLoginBloc.state).thenReturn(const LoginState(userId: 'any'));
    when(() => mockCryptocurrenciesBloc.state).thenReturn(CryptocurrenciesState(
      blocStatus: BlocStatus.submissionSuccess,
      cryptoCurrencies: cryptocurrencies_,
      cryptoCurrenciesFiltered: const [],
      querySearch: 'any',
    ));
    when(() => mockFavoritesBloc.state).thenReturn(FavoritesInitial());

    await widgetTester.pumpWidget(makeTestableWidget(HomeScreen()));
    final loading = find.text('No cryptocurrencies were found with that name');
    expect(loading, findsOneWidget);
  });
  testWidgets('Successful cryptocurrencies searching', (widgetTester) async {
    when(() => mockLoginBloc.state).thenReturn(const LoginState(userId: 'any'));
    when(() => mockCryptocurrenciesBloc.state).thenReturn(CryptocurrenciesState(
        blocStatus: BlocStatus.submissionSuccess,
        cryptoCurrencies: cryptocurrencies_,
        cryptoCurrenciesFiltered: cryptocurrencies_));
    when(() => mockFavoritesBloc.state).thenReturn(FavoritesInitial());

    await widgetTester.pumpWidget(makeTestableWidget(HomeScreen()));
    final loading = find.text('Bitcoin');
    expect(loading, findsOneWidget);
  });
}

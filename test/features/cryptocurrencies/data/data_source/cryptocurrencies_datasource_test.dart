import 'dart:convert';

import 'package:crypto/core/const%20/providers/cryptocurrencies_const.dart';
import 'package:crypto/core/extensions/either_extension.dart';
import 'package:crypto/features/cryptocurrencies/data/datasource/cryptocurrency_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helper/dummy_cryptocurrencies/dummy_cryptocurrency_response.dart';
import '../../../../helper/dummy_cryptocurrencies/dummy_models.dart';
import '../../../../helper/mocks.dart';
import 'package:http/http.dart' as http;

void main() {
  late MockHttp mockHttp;
  late CryptocurrencyDataSourceWithCoingecko
      cryptocurrencyDataSourceWithCoingecko;
  final Uri url = Uri.parse(urlGetCryptocurrenciesCoingecko);

  setUp(() {
    mockHttp = MockHttp();
    cryptocurrencyDataSourceWithCoingecko =
        CryptocurrencyDataSourceWithCoingecko(mockHttp);
  });
  group('should return a list of cryptocurrencies ', () {
    test('should return cryptocurrencies when status code is 200', () async {
      when(() => mockHttp.get(url)).thenAnswer((invocation) async =>
          http.Response(jsonEncode([fake_cryptocurrencies_response]), 200));
      final result =
          await cryptocurrencyDataSourceWithCoingecko.getCryptocurrencies();
      expect(result.asRight(), equals(cryptocurrencies_));
    });
    test('should return error message when status code is different of 200',
        () async {
      when(() => mockHttp.get(url))
          .thenAnswer((invocation) async => http.Response('', 502));
      final result =
          await cryptocurrencyDataSourceWithCoingecko.getCryptocurrencies();
      expect(result.asLeft(), equals('Error to get cryptocurrencies'));
    });
  });
}

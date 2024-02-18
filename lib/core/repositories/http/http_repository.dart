import 'dart:async';
import 'package:http/http.dart' as http;

abstract class HttpClient {
  Future<http.Response> get(Uri url, {Map<String, String>? headers});
}

class CustomeHttpClient implements HttpClient {
  @override
  Future<http.Response> get(Uri url, {Map<String, String>? headers}) {
    return http.get(url, headers: headers);
  }
}

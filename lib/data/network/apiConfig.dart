
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

import '../../util/sizeSyle.dart';


class ApiConfig {

  final _client = (() {
    final dio = Dio();

    return dio;
  })();

  Map<String, dynamic> _dynamicHash() {
    
    String timestamp = (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString();
    var hash = (md5.convert(utf8.encode("$timestamp$privateKey$publicKey"))).toString();

    return {
      "apikey" : apiKey,
      "hash" : hash,
      "ts" : timestamp
    };
  }

  Future<Response> getHeroes() async {
    return await _client.get("$baseURL$characterEndpoint", queryParameters: _dynamicHash());
  }

  Future<Response> getComicsByHero({required int heroId}) async {
    return await _client.get("$baseURL$characterEndpoint/$heroId/$comicsEndpoint", queryParameters: _dynamicHash());
  }

  Future<Response> getEventsByHero({required int heroId}) async {
    return await _client.get("$baseURL$characterEndpoint/$heroId/$eventsEndpoint", queryParameters: _dynamicHash());
  }

  Future<Response> getSeriesByHero({required int heroId}) async {
    return await _client.get("$baseURL$characterEndpoint/$heroId/$seriesEndpoint", queryParameters: _dynamicHash());
  }

  Future<Response> getStoriesByHero({required int heroId}) async {
    return await _client.get("$baseURL$characterEndpoint/$heroId/$storiesEndpoint", queryParameters: _dynamicHash());
  }

}
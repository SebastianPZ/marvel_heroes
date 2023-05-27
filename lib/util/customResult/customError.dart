import 'package:dio/dio.dart';

import '../strings.dart';

abstract class CustomError {
  String? message;
  int? httpCode;
  Map<String, dynamic> error = {};

  @override
  String toString() => message ?? "";

  bool get isHttpError => httpCode != null;
}

class HttpError extends CustomError {
  HttpError.fromCode({required code}) {
    httpCode = code;
    message = getMessageFromHttp(code);
  }

  HttpError.fromError({required CustomError error}) {
    httpCode = error.httpCode!;
    message = error.message ?? getMessageFromHttp(httpCode!);
  }

  String getMessageFromHttp(int code) {
    switch (code) {
      case httpErrorNotFound:
        return httErrorNotFoundMessage;
      case httpErrorNoServer:
        return httErrorNotServerMessage;
      default:
        return httErrorNotServerMessage;
    }
  }
}

class GenericError extends CustomError {
  GenericError.fromMessage({required errorMessage}) {
    message = errorMessage;
  }

  GenericError.fromMessageAndCode({required errorMessage, required httpCode}) {
    message = errorMessage;
  }

  GenericError.fromResponse({required Response<dynamic> response}) {
    String errorMessage = "errorMessage";
    int statusCode = response.statusCode ?? 0;

    if (response.data is Map) {
      var map = Map<String, dynamic>.from(response.data as Map);

      if (map.containsKey("Mensaje")) {
        errorMessage = map["Mensaje"] as String;
      }
    }

    message = errorMessage;
    httpCode = statusCode;

  }
}

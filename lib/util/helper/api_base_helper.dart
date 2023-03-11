import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get_connect.dart';

class ErrorModel {
  final int? statusCode;
  final dynamic bodyString;
  const ErrorModel({this.statusCode, this.bodyString});
}

enum METHODE {
  get,
  post,
  delete,
  update,
}

class ApiBaseHelper extends GetConnect {
  final String urlKey = 'api_base_urlv3';
  final String fullUrl =
      'https://gist.githubusercontent.com/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json';
  // final String fullUrl = 'https://jsonplaceholder.typicode.com/albums?page=2';
  // final String? baseurl = FlavorConfig.instance.values!.apiBaseUrl;

  Future<dynamic> onNetworkRequesting(
      {String? url,
      String? fullURL,
      Map<String, String>? header,
      Map<String, dynamic>? body,
      required METHODE? methode,
      required bool isAuthorize,
      bool isConvertToByte = false}) async {
    // final token = await LocalData.getCurrentUser();
    // final fullUrl = fullURL ?? baseurl! + url!;
    debugPrint("Requested To URL 👉 $fullUrl");
    Map<String, String> defaultHeader = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization': isAuthorize ? 'Bearer $token' : ''
    };

    try {
      switch (methode) {
        case METHODE.get:
          final response = await get(fullUrl, headers: header ?? defaultHeader);
          return _returnResponse(response, isConvertToByte);
        case METHODE.post:
          if (body != null) {
            final response = await post(fullUrl, json.encode(body),
                headers: header ?? defaultHeader);
            return _returnResponse(response, isConvertToByte);
          }
          return Future.error(
              const ErrorModel(bodyString: 'Body must be included'));

        case METHODE.delete:
          final response =
              await delete(fullUrl, headers: header ?? defaultHeader);
          return _returnResponse(response, isConvertToByte);
        case METHODE.update:
          if (body != null) {
            final response = await put(fullUrl, json.encode(body),
                headers: header ?? defaultHeader);
            return _returnResponse(response, isConvertToByte);
          }
          return Future.error(
              const ErrorModel(bodyString: 'Body must be included'));

        default:
          break;
      }
    } catch (e) {
      // FirebaseCrashlytics.instance.log(e.toString());
      return Future.error(e);
    }
  }

  dynamic _returnResponse(Response response, bool isReturnBytes) {
    switch (response.statusCode) {
      case 200:
        var responseJson = isReturnBytes
            ? response.bodyBytes
            : json.decode(response.bodyString!);
        return responseJson;
      case 201:
        var responseJson = isReturnBytes
            ? response.bodyBytes
            : json.decode(response.bodyString!);
        return responseJson;
      case 202:
        var responseJson = isReturnBytes
            ? response.bodyBytes
            : json.decode(response.bodyString!);
        return responseJson;
      case 404:
        return Future.error(
          ErrorModel(
            statusCode: response.statusCode,
            bodyString: json.decode(response.bodyString ?? ""),
          ),
        );
      case 400:
        return Future.error(
          ErrorModel(
            statusCode: response.statusCode,
            bodyString: json.decode(response.bodyString ?? ""),
          ),
        );
      case 401:
      case 403:
        return Future.error(
          ErrorModel(
            statusCode: response.statusCode,
            bodyString: json.decode(response.bodyString ?? ""),
          ),
        );
      case 500:
        return Future.error(
          ErrorModel(
            statusCode: response.statusCode,
            bodyString: json.decode(response.bodyString ?? ""),
          ),
        );

      default:
        return Future.error(
          ErrorModel(
            statusCode: response.statusCode,
            bodyString: json.decode(response.bodyString ?? ""),
          ),
        );
    }
  }
}

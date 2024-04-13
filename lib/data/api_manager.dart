import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_ahmed/model/ArticalResponse.dart';
import 'package:news_ahmed/model/SourcesResponse.dart';

abstract class ApiManager {
  static Future LoadTabsList(String categoryId) async {
    try {
      Uri url = Uri.parse(
          "https://newsapi.org/v2/top-headlines/sources?apiKey=cced8ae80f8740c195f8e2b7dd6a7712&category=$categoryId");
      Response response = await get(url);
      SourcesResponse sourcesResponse =
          SourcesResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return sourcesResponse;
      } else {
        throw sourcesResponse.message ??
            'something went wrong please try again';
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<ArticalResponse> loadArticalList(String sourceId) async {
    try {
      Uri url = Uri.parse(
          "https://newsapi.org/v2/everything?apiKey=cced8ae80f8740c195f8e2b7dd6a7712&sources=$sourceId");
      Response apiResponse = await get(url);
      ArticalResponse articalResponse =
          ArticalResponse.fromJson(jsonDecode(apiResponse.body));
      if (apiResponse.statusCode >= 200 && apiResponse.statusCode < 300) {
        return articalResponse;
      } else {
        throw articalResponse.message ?? "Something went Wrong";
      }
    } catch (e) {
      rethrow;
    }
  }
}

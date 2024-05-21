import 'dart:convert';

import 'package:currency/constant/Constant.dart';
import 'package:currency/model_api/ModelApi.dart';
import 'package:http/http.dart';

class ApiService {
  Future<List<ModelApi>> getLatest(String baseCurrency) async {
    String url = '${base_url}apikey=$api_key&base_currency=$baseCurrency';
    List<ModelApi> currencyList = [];
    try {
      final response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        Map<String, dynamic> body = json['data'];
        body.forEach((key, value) {
          ModelApi modelApi = ModelApi.fromJson(value);
          currencyList.add(modelApi);
        });
        return currencyList;
      } else
        throw ("no data found");
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<List<ModelApi>> getExchange(String baseCurrency,String targetCurrency) async {
    String url = '${base_url}apikey=$api_key&base_currency=$baseCurrency&currencies=$targetCurrency';
    List<ModelApi> currencyList = [];
    try {
      final response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        Map<String, dynamic> body = json['data'];
        body.forEach((key, value) {
          ModelApi modelApi = ModelApi.fromJson(value);
          currencyList.add(modelApi);
        });
        return currencyList;
      } else
        throw ("no data found");
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dreambiztech/api/response_model.dart';


class ApiProvider {
  final Dio _dio = Dio();
 // static String BASE_URL="http://127.0.0.1:5000/products";
  static String BASE_URL="http://192.168.140.249:5000/";
  static String GET_PRODUCT_LIST="${BASE_URL}products";
  Future<ResponseModel> fetchProductList() async {
    try {
      Response response = await _dio.get(GET_PRODUCT_LIST);
      print(response);
      return ResponseModel.fromJson(jsonDecode(response.data));
    } catch (error, stacktrace) {
      print("Exception occurred: $error\nStackTrace: $stacktrace");
      return ResponseModel.withError("Data not found / Connection issue");
    }
  }
}



import 'package:dreambiztech/Pojo/product.dart';

class ResponseModel {
  bool? status;
  List<Product>? products;
  String? error;

  ResponseModel({this.status, this.products, this.error});

  ResponseModel.withError(String errorMessage) {
    error = errorMessage;
  }

  ResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['products'] != null) {
      products = List<Product>.from(
        json['products'].map((productJson) => Product.fromJson(productJson)),
      );
    }
    error = json['error'];
  }
}

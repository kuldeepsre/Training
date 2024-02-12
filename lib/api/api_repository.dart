import 'package:dreambiztech/api/api_provider.dart';
import 'package:dreambiztech/api/response_model.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<ResponseModel> fetchProductList() {
    return _provider.fetchProductList();
  }
}

class NetworkError extends Error {}
class Constants{
   // static String BASE_URL="http://127.0.0.1:5000/products";
   // static String GET_PRODUCT_LIST=BASE_URL+"products";
  static const BASE_URL = "";
  static const BASE_URL_IMAGE = "";
  static const LOGIN_API_URL = BASE_URL + "login";
  static String user_token = "";
  static Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    'Content-Type': 'application/json; charset=UTF-8',
    'connection': 'keep-alive',
    "app_key": "caeb1afaaeb9598a22a17d27ad3120a9754b5170b253b81da576404212052441",
    "token": user_token
  };

}


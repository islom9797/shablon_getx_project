class RequestParam {
  static Map<String, String> empty() {
    Map<String, String> params = {};
    return params;
  }

  static Map<String, dynamic> favoriteProducts() {
    Map<String, dynamic> params = {'favoriteProducts': "true"};
    return params;
  }

  static Map<String, dynamic> getAddresses({bool isTrue = true}) {
    Map<String, dynamic> params = {"address": "$isTrue"};
    return params;
  }

  static Map<String, dynamic> getOrders({bool isTrue = true}) {
    Map<String, dynamic> params = {"products": "$isTrue"};
    return params;
  }

}

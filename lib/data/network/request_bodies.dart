

class RequestBody {
  static Map<String, String> requestSms(String phone) {
    Map<String, String> body = {"phone": phone};
    return body;
  }

}

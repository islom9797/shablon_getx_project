

import '../database/db_service.dart';

class Api {
  static String serverDev = DBService.to.getDomainUrl().isNotEmpty
      ? DBService.to.getDomainUrl()
      : "shohona-default-services-1126731213.ap-northeast-2.elb.amazonaws.com";
  static String serverPro =
      "api.shohona.com";
  static const String version = '/v1';

  static const String users = '$version/users';

  //auth
  static const String requestCode = '$version/auth/requestCode';
  static const String verifyCode = '$version/auth/validateCode';
  static const String refreshToken = '$version/auth/refreshToken';

  //user
  static const String accountInfo = '$version/users/me';
  static const String updateAccountInfo = '$version/users/updateMe';

  //product
  static const String getProducts = '$version/products';
  static const String getFavoriteProducts = '$version/users/me';

  //Cart
  static const String cartItems = '$version/cartItems';

  //addresses
  static const String addresses = '$version/addresses';

  //orders
  static const String orders = '$version/orders';

  // notifications
  static const String notifications = '$version/notifications/myNotifications';

  //staticInfos
  static const String staticInfos = '$version/users/getStaticInfo';


}

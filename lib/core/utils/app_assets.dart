class AppAssets {
  static Images images = const Images();
  static Lotties lotties = const Lotties();
  static IconsInAssets icons = const IconsInAssets();
}

class Images {
  const Images();

  String get logo => "assets/logo.png";

  String get emptyCart => "assets/images/empty_cart.png";

  String get emptyNotification => "assets/images/empty_notification.png";

  String get noAddress => "assets/images/no_address.png";

  String get noFavorites => "assets/images/no_favorites.png";

  String get verifyCode => "assets/images/verify_code.png";

  String get verifyNumber => "assets/images/verify_number.png";
}

class IconsInAssets {
  const IconsInAssets();

  String get left => "assets/icons/arrow_left.svg";

  String get left2 => "assets/icons/arrow_left_2.svg";

  String get back => "assets/icons/back.svg";

  String get bell => "assets/icons/bell.svg";

  String get bellFill => "assets/icons/bell_fill.svg";

  String get cart => "assets/icons/cart.svg";

  String get cartFill => "assets/icons/cart_fill.svg";

  String get category => "assets/icons/category.svg";

  String get categoryFill => "assets/icons/category_fill.svg";

  String get close => "assets/icons/close.svg";

  String get delete => "assets/icons/delete.svg";

  String get favorites => "assets/icons/favorites.svg";

  String get favoritesFill => "assets/icons/favorites_fill.svg";

  String get home => "assets/icons/home.svg";

  String get homeFill => "assets/icons/home_fill.svg";

  String get infoCircle => "assets/icons/info_circle.svg";

  String get infoSquare => "assets/icons/info_square.svg";

  String get lang => "assets/icons/lang.svg";

  String get location => "assets/icons/location.svg";

  String get logout => "assets/icons/logout.svg";

  String get me => "assets/icons/me.svg";

  String get meFill => "assets/icons/me_fill.svg";

  String get order => "assets/icons/order.svg";

  String get orderFill => "assets/icons/order_fill.svg";

  String get pickUp => "assets/icons/pick-up.svg";

  String get right => "assets/icons/right.svg";

  String get settings => "assets/icons/settings.svg";

  String get settingsFill => "assets/icons/settings_fill.svg";

  String get share => "assets/icons/share.svg";

  String get star => "assets/icons/star.svg";

  String get starFill => "assets/icons/star_fill.svg";

  String get help => "assets/icons/contact.svg";

  String get edit => "assets/icons/edit.svg";
}

class Lotties {
  const Lotties();

  String get loading => "assets/lottie/loading.json";

  String get loadingGreen => "assets/lottie/loading_green.json";
}

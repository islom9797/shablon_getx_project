import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';


final GlobalKey<NavigatorState>? navigatorKey = Get.nestedKey(0);
final GlobalKey<NavigatorState>? mainNavigatorKey = Get.nestedKey(1);

class Routes {
  static String splash = "/";
  static String login = "/login";
  static String signUp = "/signUp";
  // main
  static const String main = "/main";
  static const String shop = "/main/shop";
  static const String favorites = "/main/favorites";
  static const String cart = "/main/cart";
  static const String notifications = "/main/notifications";
  static const String profile = "/main/profile";
  static const String product = "/main/product";
  //
  static String checkout = "/checkout";
  static String addressBook = "/addressBook";
  static String orderList = "/orders";
  static String order = "/orders/:id";
  static String addAddress = "/addAddress";
  static String help = "/help";
  static String feedback = "/feedback";
  static String inviteFriend = "/inviteFriend";
  static String notFound = "/notFound";
}


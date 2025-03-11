
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/services/lang_service.dart';
import 'storage_keys.dart';


class DBService {
  final GetStorage _box = GetStorage();

  static DBService get to => Get.find<DBService>();

  static Future<void> init() async {
    await Get.putAsync<DBService>(() async {
      final storageService = DBService();
      await GetStorage.init();
      return storageService;
    }, permanent: true);
  }

  bool isLoggedIn() {
    return getAccessToken().isNotEmpty;
  }

  Future<void> logOut() async {
    // in order save language & domain after logout
    var language = getLanguage();
    var domain = getDomainUrl();
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    firebaseMessaging.deleteToken();
    await _box.erase(); // Clear all data on local DB
    // Get.offAll(() => const SignInPage());

    // in order save language & domain after logout
    setLanguage(language);
    setDomainUrl(domain);
  }

  // Access Token ==============================================================
  Future<void> setAccessToken(String? value) async {
    await _box.write(StorageKeys.ACCESS_TOKEN, value);
  }

  String getAccessToken() {
    return _box.read(StorageKeys.ACCESS_TOKEN) ?? "";
  }

  // Access AccountInfo ========================================================
  // Future<void> setAccountInfo(User user) async {
  //   await _box.write(StorageKeys.ACCOUNT_INFO, user.toJson());
  // }
  //
  // User getAccountInfo() {
  //   var item = _box.read(StorageKeys.ACCOUNT_INFO);
  //   return item != null ? User.fromJson(item) : User();
  // }

  // App Language ==============================================================
  String getLanguage() {
    var lang = _box.read(StorageKeys.LANGUAGE);
    if (lang == null || lang.isEmpty) return LangService.langs[0];

    return lang;
  }

  Future<void> setLanguage(String code) async {
    await _box.write(StorageKeys.LANGUAGE, code);
  }


  // Firebase Token ============================================================
  Future<void> setFirebaseToken(String? value) async {
    await _box.write(StorageKeys.FCM_TOKEN, value);
  }

  String getFirebaseToken() {
    return _box.read(StorageKeys.FCM_TOKEN) ?? "";
  }

  // Domain URL ================================================================
  Future<void> setDomainUrl(String? value) async {
    await _box.write(StorageKeys.DOMAIN, value);
  }

  String getDomainUrl() {
    return _box.read(StorageKeys.DOMAIN) ?? "";
  }
  // //Static info ================================================================
  //
  // Future<void> setStaticInfos(StaticInfo staticInfo) async {
  //   await _box.write(StorageKeys.STATIC_INFOS, staticInfo.toJson());
  // }
  //
  // StaticInfo getStaticInfos() {
  //   var item = _box.read(StorageKeys.STATIC_INFOS);
  //   return item != null ? StaticInfo.fromJson(item) : StaticInfo();
  // }
}

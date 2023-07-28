import 'package:get/get.dart';

import '../data/repos/auth/auth_repo_impl.dart';
import '../data/repos/auth/user_repo_impl.dart';
import '../domain/repos/auth/auth_repo.dart';
import '../domain/repos/auth/user_repo.dart';
import '../presentation/pages/splash/splash_controller.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    // repositories
    Get.lazyPut<AuthRepo>(() => AuthRepoImpl(), fenix: true);
    Get.lazyPut<UserRepo>(() => UserRepoImpl(), fenix: true);

    // controllers
    Get.lazyPut(() => SplashController(Get.find(), Get.find()), fenix: true);


  }
}

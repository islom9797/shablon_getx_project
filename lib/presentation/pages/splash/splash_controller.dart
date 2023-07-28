import 'package:get/get.dart';

import '../../../data/database/db_service.dart';
import '../../../domain/repos/auth/auth_repo.dart';
import '../../../domain/repos/auth/user_repo.dart';

class SplashController extends GetxController {
  final UserRepo userRepo;
  final AuthRepo authRepo;

  SplashController(this.userRepo, this.authRepo);

  @override
  void onInit() async {
    super.onInit();
    await checkIfLoggedIn();
  }

  Future<void> checkIfLoggedIn() async {
    if (DBService.to.isLoggedIn()) {
      // refreshToken();
      // await staticInfo();
      // accountInfo();
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        // Get.off(() => const SignInPage());
      });
    }
  }
  //
  // Future<void> accountInfo() async {
  //   var either = await userRepo.getAccountInfo();
  //   either.fold((l) {
  //     DBService.to.logOut();
  //   }, (r) async {
  //     r.name?.isNotEmpty == true
  //         ? Get.offAll(() => const MainPage())
  //         : Get.offAll(() => const SignUpPage());
  //   });
  // }

  // Future<void> refreshToken() async {
  //   var either = await authRepo.refreshToken();
  //   either.fold((l) => null, (r) async {
  //     DBService.to.setAccessToken(r?.accessToken);
  //   });
  // }
  //
  // Future<void> staticInfo() async {
  //   var either = await userRepo.getStaticInfo();
  //   await either.fold((l) => null, (r) async {
  //     await DBService.to.setStaticInfos(r);
  //   });
  // }
}

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'config/app_theme.dart';
import 'config/root_binding.dart';
import 'core/services/lang_service.dart';
import 'core/services/root_service.dart';
import 'presentation/pages/splash/splash_page.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RootService.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // Main_Init(context);

    return ScreenUtilInit(
      // designSize: const Size(375, 756),
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: '검진여기',
          debugShowCheckedModeBanner: false,
          navigatorKey: RootService.alice.getNavigatorKey(),
          theme: AppTheme.appTheme,
          scrollBehavior: const ScrollBehavior().copyWith(
              overscroll: false, physics: const ClampingScrollPhysics()),
          initialBinding: RootBinding(),
          initialRoute: SplashPage.id,
          routes: {SplashPage.id: (context) => const SplashPage()},
          //Language setting
          defaultTransition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 200),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: LangService.locales,

          locale: Locale('uz', 'UZ'),
          builder: (context, child) {
            // ScreenUtil.set
            return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(1.0)),
              child: child!,
            );
          },
        );
      },
    );
  }
}
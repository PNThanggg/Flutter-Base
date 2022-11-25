import 'package:get/get.dart';

import '../binding/home_binding.dart';
import '../binding/intro_binding.dart';
import '../binding/selected_image_binding.dart';
import '../binding/splash_binding.dart';
import '../binding/subscribe_binding.dart';
import '../ui/screen/category_screen.dart';
import '../ui/screen/home_screen.dart';
import '../ui/screen/intro_screen.dart';
import '../ui/screen/selected_image_screen.dart';
import '../ui/screen/setting_screen.dart';
import '../ui/screen/splash_screen.dart';
import '../ui/screen/subscribe_screen.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoute.splash_screen, page: () => const SplashScreen(), binding: SplashBinding()),
    GetPage(name: AppRoute.intro_screen, page: () => const IntroScreen(), binding: IntroBinding()),
    GetPage(name: AppRoute.home_screen, page: () => HomeScreen(), binding: HomeBinding()),
    GetPage(name: AppRoute.setting_screen, page: () => const SettingScreen(), transition: Transition.rightToLeft),
    GetPage(name: AppRoute.category_screen, page: () => const CategoryScreen(), transition: Transition.downToUp),
    GetPage(
        name: AppRoute.subscriber_screen,
        page: () => const SubscribeScreen(),
        binding: SubscribeBinding(),
        transition: Transition.downToUp),
    GetPage(name: AppRoute.selected_image_screen, page: () => SelectedImageScreen(), binding: SelectedImageBinding()),
  ];
}

class AppRoute {
  static const String splash_screen = '/splash_screen';
  static const String home_screen = '/home_screen';
  static const String intro_screen = '/intro_screen';
  static const String setting_screen = '/setting_screen';
  static const String category_screen = '/category_screen';
  static const String subscriber_screen = '/subscriber_screen';
  static const String selected_image_screen = '/selected_image_screen';
}
import 'package:auto_route/annotations.dart';
import 'package:healthy_step/pages/food_detail_page.dart';
import 'package:healthy_step/pages/form_page.dart';
import 'package:healthy_step/pages/home_page.dart';
import 'package:healthy_step/pages/main_page.dart';
import 'package:healthy_step/pages/profile_page.dart';
import 'package:healthy_step/pages/report_page.dart';
import 'package:healthy_step/pages/sign_in.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MainPage, initial: true),
    AutoRoute(page: HomePage),
    AutoRoute(page: ReportPage),
    AutoRoute(page: ProfilePage),
    AutoRoute(page: FormPage),
    AutoRoute(page: SignInPage),
    AutoRoute(page: FoodInfoPage),
  ],
)
class $AppRouter {}

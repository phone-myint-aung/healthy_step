// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../models/meal.dart' as _i10;
import '../pages/food_detail_page.dart' as _i9;
import '../pages/form_page.dart' as _i7;
import '../pages/home_page.dart' as _i4;
import '../pages/main_page.dart' as _i3;
import '../pages/profile_page.dart' as _i6;
import '../pages/report_page.dart' as _i5;
import '../pages/sign_in.dart' as _i8;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    MainRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args =
              data.argsAs<MainRouteArgs>(orElse: () => const MainRouteArgs());
          return _i3.MainPage(pageIndex: args.pageIndex, key: args.key);
        }),
    HomeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.HomePage();
        }),
    ReportRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i5.ReportPage();
        }),
    ProfileRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i6.ProfilePage();
        }),
    FormRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i7.FormPage();
        }),
    SignInRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i8.SignInPage();
        }),
    FoodInfoRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<FoodInfoRouteArgs>();
          return _i9.FoodInfoPage(args.meal, key: args.key);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(MainRoute.name, path: '/'),
        _i1.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i1.RouteConfig(ReportRoute.name, path: '/report-page'),
        _i1.RouteConfig(ProfileRoute.name, path: '/profile-page'),
        _i1.RouteConfig(FormRoute.name, path: '/form-page'),
        _i1.RouteConfig(SignInRoute.name, path: '/sign-in-page'),
        _i1.RouteConfig(FoodInfoRoute.name, path: '/food-info-page')
      ];
}

class MainRoute extends _i1.PageRouteInfo<MainRouteArgs> {
  MainRoute({int? pageIndex, _i2.Key? key})
      : super(name,
            path: '/', args: MainRouteArgs(pageIndex: pageIndex, key: key));

  static const String name = 'MainRoute';
}

class MainRouteArgs {
  const MainRouteArgs({this.pageIndex, this.key});

  final int? pageIndex;

  final _i2.Key? key;
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute() : super(name, path: '/home-page');

  static const String name = 'HomeRoute';
}

class ReportRoute extends _i1.PageRouteInfo {
  const ReportRoute() : super(name, path: '/report-page');

  static const String name = 'ReportRoute';
}

class ProfileRoute extends _i1.PageRouteInfo {
  const ProfileRoute() : super(name, path: '/profile-page');

  static const String name = 'ProfileRoute';
}

class FormRoute extends _i1.PageRouteInfo {
  const FormRoute() : super(name, path: '/form-page');

  static const String name = 'FormRoute';
}

class SignInRoute extends _i1.PageRouteInfo {
  const SignInRoute() : super(name, path: '/sign-in-page');

  static const String name = 'SignInRoute';
}

class FoodInfoRoute extends _i1.PageRouteInfo<FoodInfoRouteArgs> {
  FoodInfoRoute({required _i10.Meal meal, _i2.Key? key})
      : super(name,
            path: '/food-info-page',
            args: FoodInfoRouteArgs(meal: meal, key: key));

  static const String name = 'FoodInfoRoute';
}

class FoodInfoRouteArgs {
  const FoodInfoRouteArgs({required this.meal, this.key});

  final _i10.Meal meal;

  final _i2.Key? key;
}

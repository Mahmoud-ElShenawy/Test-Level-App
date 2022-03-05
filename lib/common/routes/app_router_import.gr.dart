// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../view/screen/create_design_screen.dart' as _i2;
import '../../view/screen/home_screen.dart' as _i1;
import '../../view/screen/photo_view_screen.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeScreenRoute.name: (routeData) {
      return _i4.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i1.HomeScreen(),
          transitionsBuilder: _i4.TransitionsBuilders.slideRightWithFade,
          durationInMilliseconds: 350,
          opaque: true,
          barrierDismissible: false);
    },
    CreateDesignRoute.name: (routeData) {
      return _i4.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.CreateDesignScreen(),
          transitionsBuilder: _i4.TransitionsBuilders.slideRightWithFade,
          durationInMilliseconds: 350,
          opaque: true,
          barrierDismissible: false);
    },
    PhotoViewRoute.name: (routeData) {
      return _i4.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i3.PhotoViewScreen(),
          transitionsBuilder: _i4.TransitionsBuilders.slideRightWithFade,
          durationInMilliseconds: 350,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig('/#redirect',
            path: '/', redirectTo: 'home', fullMatch: true),
        _i4.RouteConfig(HomeScreenRoute.name, path: 'home'),
        _i4.RouteConfig(CreateDesignRoute.name, path: 'create_design'),
        _i4.RouteConfig(PhotoViewRoute.name, path: 'photo_view')
      ];
}

/// generated route for
/// [_i1.HomeScreen]
class HomeScreenRoute extends _i4.PageRouteInfo<void> {
  const HomeScreenRoute() : super(HomeScreenRoute.name, path: 'home');

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i2.CreateDesignScreen]
class CreateDesignRoute extends _i4.PageRouteInfo<void> {
  const CreateDesignRoute()
      : super(CreateDesignRoute.name, path: 'create_design');

  static const String name = 'CreateDesignRoute';
}

/// generated route for
/// [_i3.PhotoViewScreen]
class PhotoViewRoute extends _i4.PageRouteInfo<void> {
  const PhotoViewRoute() : super(PhotoViewRoute.name, path: 'photo_view');

  static const String name = 'PhotoViewRoute';
}

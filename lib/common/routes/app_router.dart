part of 'app_router_import.dart';

//The root router is the top-level router of your app that serves as the navigation entry point of your app
@CustomAutoRouter(
  transitionsBuilder: TransitionsBuilders.slideRightWithFade,
  durationInMilliseconds: 350,
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: HomeScreen.routeName,
      page: HomeScreen,
      initial: true,
      name: 'HomeScreenRoute',
    ),
    AutoRoute(
      path: CreateDesignScreen.routeName,
      page: CreateDesignScreen,
      name: 'CreateDesignRoute',
    ),
    AutoRoute(
      path: PhotoViewScreen.routeName,
      page: PhotoViewScreen,
      name: 'PhotoViewRoute',
    ),
  ],
)

class $AppRouter {}
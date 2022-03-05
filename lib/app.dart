import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_level_project/common/routes/app_router_observer.dart';
import 'package:test_level_project/di/di_imports.dart';

import 'common/routes/app_router_import.gr.dart';

// Responsible of App Routing
final _appRouter = AppRouter();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // Define a Providers of Cubits' DI
      providers: [
        ...providers(context),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: _appRouter.delegate(
          navigatorObservers: () => [
            // Observe Route Changes of App Navigation [Push & Replace & Pop ]
            AppRouterObserver(),
          ],
        ),
        routeInformationParser:
            _appRouter.defaultRouteParser(includePrefixMatches: true),
        routeInformationProvider: _appRouter.routeInfoProvider(),
      ),
    );
  }
}

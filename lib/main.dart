import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_level_project/di/di_imports.dart';

import 'app.dart';
import 'util/bloc_observer.dart';

main() => {
  // Need the binding to be initialized before calling runApp
      WidgetsFlutterBinding.ensureInitialized(),
  // Define a Top-Level Function of DI
      configureDependencies(),
  // Observe State Changes of Cubits [Create & Event & Change & Transition & Error & Close]
      BlocOverrides.runZoned(
        () => runApp(const App()),
        blocObserver: AppBlocObserver(),
      ),
    };

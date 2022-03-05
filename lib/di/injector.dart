part of 'di_imports.dart';

Logger logger = Logger();

final getIt = GetIt.instance;

@injectableInit
GetIt configureDependencies() => $initGetIt(getIt);

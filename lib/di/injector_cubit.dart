part of 'di_imports.dart';

List providers(BuildContext context) {
  return [
    BlocProvider(
      create: (context) => DesignsCubit(
        DesignsRepository(),
      ),
    ),
    BlocProvider(
      create: (context) => ImageCubit(),
    ),
  ];
}

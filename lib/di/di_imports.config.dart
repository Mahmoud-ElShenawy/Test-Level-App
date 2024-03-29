// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../cubit/designs_cubit/designs_cubit.dart' as _i5;
import '../cubit/image_cubit/image_cubit.dart' as _i4;
import '../repository/designs_repository.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.DesignsRepository>(() => _i3.DesignsRepository());
  gh.factory<_i4.ImageCubit>(() => _i4.ImageCubit());
  gh.factory<_i5.DesignsCubit>(
      () => _i5.DesignsCubit(get<_i3.DesignsRepository>()));
  return get;
}

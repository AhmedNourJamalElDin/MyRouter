// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import '../../auth/services/auth.service.dart' as _i5;
import '../services/router.service.dart' as _i3;
import 'module.dart' as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.RouterService>(registerModule.routerService);
  await gh.singletonAsync<_i4.SharedPreferences>(
      () => registerModule.sharedPrefs,
      preResolve: true);
  gh.singleton<_i5.AuthService>(
      registerModule.authService(get<_i4.SharedPreferences>()));
  return get;
}

class _$RegisterModule extends _i6.RegisterModule {}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:event_bus/event_bus.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../../auth/services/auth.service.dart' as _i6;
import '../services/router.service.dart' as _i4;
import 'module.dart' as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.EventBus>(registerModule.eventBus);
  gh.singleton<_i4.RouterService>(registerModule.routerService);
  await gh.singletonAsync<_i5.SharedPreferences>(
      () => registerModule.sharedPrefs,
      preResolve: true);
  gh.singleton<_i6.AuthService>(
      registerModule.authService(get<_i5.SharedPreferences>()));
  return get;
}

class _$RegisterModule extends _i7.RegisterModule {}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RegistrationModuleBuilder
// **************************************************************************

import 'package:modular/boot/boot_provider_registrar.dart' as _i1;
import 'package:modular/event.dart' as _i5;
import 'package:modular/event/event_provider_registrar.dart' as _i2;
import 'package:router_setting/accounts/module.dart' as _i4;
import 'package:router_setting/core/core.module.dart' as _i3;

Future<void> $initRegistrationModule() async {
  final bootProviderRegistrar = _i1.BootProviderRegistrar();
  final eventProviderRegistrar = _i2.EventProviderRegistrar();
  await _i3.CoreModule(bootProviderRegistrar, eventProviderRegistrar).boot();
  await _i4.AccountsModule(bootProviderRegistrar, eventProviderRegistrar)
      .boot();
  await bootProviderRegistrar.boot();
  await eventProviderRegistrar.boot(_i5.eventBus);
}

import 'package:router_setting/core/module.dart';
import 'package:router_setting/core/providers/hive_boot_provider.dart';
import 'package:router_setting/core/providers/ioc_boot_provider.dart';
import 'package:router_setting/core/registrars/boot_provider_registrar.dart';
import 'package:router_setting/core/registrars/event_provider_registrar.dart';

class CoreModule extends Module {
  CoreModule(BootProviderRegistrar bootProviderRegistrar,
      EventProviderRegistrar eventProviderRegistrar)
      : super(bootProviderRegistrar, eventProviderRegistrar);

  @override
  Future<void> boot() async {
    bootProviderRegistrar.addBootProvider(IocBootProvider());
    bootProviderRegistrar.addBootProvider(HiveBootProvider());
  }
}

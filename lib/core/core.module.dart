import 'package:modular/modular.dart';
import 'package:router_setting/core/providers/hive_boot_provider.dart';
import 'package:router_setting/core/providers/ioc_boot_provider.dart';

@RegisterModule(order: 0)
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

import 'package:router_setting/core/registrars/boot_provider_registrar.dart';
import 'package:router_setting/core/registrars/event_provider_registrar.dart';

abstract class Module {
  BootProviderRegistrar bootProviderRegistrar;
  EventProviderRegistrar eventProviderRegistrar;

  Module(this.bootProviderRegistrar, this.eventProviderRegistrar);

  Future<void> boot();
}

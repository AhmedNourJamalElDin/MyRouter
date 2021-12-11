import 'package:event_bus/event_bus.dart';
import 'package:router_setting/core/ioc/locator.dart';
import 'package:router_setting/core/module.dart';
import 'package:router_setting/core/registrars/boot_provider_registrar.dart';
import 'package:router_setting/core/registrars/event_provider_registrar.dart';
import 'package:router_setting/core/widgets/module_booter.dart';

class ModulesBooterService {
  List<Module> modules = [];

  late final BootProviderRegistrar bootProviderRegistrar;
  late final EventProviderRegistrar eventProviderRegistrar;

  ModulesBooterService();

  Future<void> boot() async {
    for (var module in modules) {
      await module.boot();
    }
  }

  void addAll(List<Module> modules) {
    this.modules.addAll(modules);
  }

  void init() {
    bootProviderRegistrar = BootProviderRegistrar();
    eventProviderRegistrar = EventProviderRegistrar();
  }

  Future<void> start() async {
    await bootProviderRegistrar.boot();
    await eventProviderRegistrar.boot(getIt<EventBus>());
  }

  Future<void> addAllFromBuilder(ModuleBuilder moduleBuilder) async {
    modules.addAll(await moduleBuilder(
        bootProviderRegistrar,
        eventProviderRegistrar
    ));
  }
}

final modulesBooter = ModulesBooterService();

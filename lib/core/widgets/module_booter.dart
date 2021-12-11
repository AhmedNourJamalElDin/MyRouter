import 'package:event_bus/event_bus.dart';
import 'package:flutter/widgets.dart';
import 'package:router_setting/core/ioc/locator.dart';
import 'package:router_setting/core/module.dart';
import 'package:router_setting/core/registrars/boot_provider_registrar.dart';
import 'package:router_setting/core/registrars/event_provider_registrar.dart';
import 'package:router_setting/core/services/module_booter.service.dart';

typedef ModuleBuilder = Future<List<Module>> Function(
    BootProviderRegistrar, EventProviderRegistrar);

class ModuleBooter extends StatefulWidget {
  final Widget child;
  final ModuleBuilder moduleBuilder;

  ModuleBooter({
    required this.child,
    required this.moduleBuilder,
    Key? key,
  }) : super(key: key);

  @override
  State<ModuleBooter> createState() => _ModuleBooterState();
}

class _ModuleBooterState extends State<ModuleBooter> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void initState() {
    super.initState();

    modulesBooter.init();
    modulesBooter.addAllFromBuilder(widget.moduleBuilder);
  }
}

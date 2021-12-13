import 'package:router_setting/core/ioc/locator.dart';
import 'package:router_setting/core/registrars/boot_provider_registrar.dart';

class IocBootProvider extends BootProvider {
  @override
  Future<void> boot() async {
    configureDependencies();
  }
}
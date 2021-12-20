import 'package:modular/modular.dart';
import 'package:router_setting/core/ioc/locator.dart';

class IocBootProvider extends BootProvider {
  @override
  Future<void> boot() async {
    configureDependencies();
  }
}
import 'package:hive_flutter/hive_flutter.dart';
import 'package:router_setting/core/registrars/boot_provider_registrar.dart';

class HiveBootProvider extends BootProvider {
  @override
  Future<void> boot() async {
    await Hive.initFlutter();
  }
}

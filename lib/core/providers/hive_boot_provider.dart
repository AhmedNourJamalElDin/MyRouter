import 'package:hive_flutter/hive_flutter.dart';
import 'package:modular/modular.dart';

class HiveBootProvider extends BootProvider {
  @override
  Future<void> boot() async {
    await Hive.initFlutter();
  }
}

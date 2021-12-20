import 'package:hive_flutter/hive_flutter.dart';
import 'package:modular/boot/boot_provider.dart';
import 'package:router_setting/accounts/models/account.model.dart';

class HiveAccountsBootProvider extends BootProvider {
  @override
  Future<void> boot() async {
    Hive.registerAdapter(AccountModelAdapter());

    await Hive.openBox<AccountModel>(accountsBoxName);
  }
}
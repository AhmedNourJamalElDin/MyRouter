import 'package:hive_flutter/hive_flutter.dart';
import 'package:router_setting/accounts/models/account.model.dart';
import 'package:router_setting/core/registrars/boot_provider_registrar.dart';

class HiveAccountsBootProvider extends BootProvider {
  @override
  Future<void> boot() async {
    Hive.registerAdapter(AccountModelAdapter());

    await Hive.openBox<AccountModel>(accountsBoxName);
  }
}
import 'package:hive_flutter/hive_flutter.dart';
import 'package:router_setting/accounts/models/account.model.dart';
import 'package:router_setting/core/event_listener.dart';
import 'package:router_setting/core/ioc/locator.dart';

Future<void> boot() async {
  await configureDependencies();
  await Hive.initFlutter();
  Hive.registerAdapter(AccountModelAdapter());

  await Hive.openBox<AccountModel>(accountsBoxName);

  configureEventListener();
}
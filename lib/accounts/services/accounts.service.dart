import 'package:collection/collection.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:router_setting/accounts/models/account.model.dart';

class AccountsService {
  late final Box<AccountModel> box;

  AccountsService() {
    box = Hive.box<AccountModel>(accountsBoxName);
  }

  void create(AccountModel account) {
    box.add(account);
    account.save();
  }

  bool has(AccountModel account) {
    final item = box.values.firstWhereOrNull((item) => item == account);

    return item != null;
  }

  AccountModel? firstByGatewayIp(String gatewayIp) {
    return box.values.firstWhereOrNull((element) => element.url.contains(gatewayIp));
  }
}

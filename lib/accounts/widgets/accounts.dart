import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:router_setting/accounts/models/account.model.dart';
import 'package:router_setting/accounts/widgets/accounts_table.dart';

class Accounts extends StatefulWidget {
  const Accounts({Key? key}) : super(key: key);

  @override
  _AccountsState createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  late Future<Box<AccountModel>> hiveFuture;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AccountsTable(Hive.box<AccountModel>(accountsBoxName));
  }
}

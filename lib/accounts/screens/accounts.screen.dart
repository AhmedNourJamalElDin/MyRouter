import 'package:flutter/material.dart';
import 'package:router_setting/accounts/widgets/accounts.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(25),
            child: Text(
              "Your Accounts",
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Accounts(),
        ],
      ),
    );
  }
}

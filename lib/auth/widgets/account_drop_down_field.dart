import 'package:flutter/material.dart';
import 'package:router_setting/accounts/models/account.model.dart';
import 'package:separated_row/separated_row.dart';

class AccountDropDownField extends StatelessWidget {
  final void Function(AccountModel?) onChanged;
  final Iterable<AccountModel> values;

  const AccountDropDownField({
    required this.values,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<AccountModel>(
      decoration: const InputDecoration(
        labelText: "Account",
        border: OutlineInputBorder(),
      ),
      onChanged: onChanged,
      value: values.first,
      items: values
          .map(
            (account) => DropdownMenuItem<AccountModel>(
              value: account,
              child: AccountRow(account),
            ),
          )
          .toList(),
    );
  }
}

class AccountRow extends StatelessWidget {
  final AccountModel account;

  const AccountRow(
    this.account, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SeparatedRow(
      separatorBuilder: (_, __) => const SizedBox(width: 10),
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(account.url),
        Text(
          account.username,
          style: const TextStyle(fontSize: 10, color: Colors.grey),
        ),
      ],
    );
  }
}

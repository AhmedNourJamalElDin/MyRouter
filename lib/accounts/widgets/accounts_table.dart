import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:router_setting/accounts/models/account.model.dart';
import 'package:router_setting/accounts/widgets/account_form.dart';
import 'package:router_setting/core/services/dialog.service.dart';
import 'package:router_setting/core/widgets/click_to_reveal.dart';

class AccountsTable extends StatefulWidget {
  final Box<AccountModel> box;

  const AccountsTable(this.box, {Key? key}) : super(key: key);

  @override
  State<AccountsTable> createState() => _AccountsTableState();
}

class _AccountsTableState extends State<AccountsTable> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: ElevatedButton(
              child: Text("Add New Account"),
              onPressed: onAddPressed,
              style: ElevatedButton.styleFrom(primary: Colors.green),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ValueListenableBuilder<Box<AccountModel>>(
              valueListenable: widget.box.listenable(),
              builder: (context, box, _) => DataTable(
                columns: [
                  DataColumn(
                    label: Text("URL"),
                  ),
                  DataColumn(
                    label: Text("Username"),
                  ),
                  DataColumn(
                    label: Text("Password"),
                  ),
                  DataColumn(
                    label: Text("Actions"),
                  ),
                ],
                rows: [
                  for (var account in box.values)
                    DataRow(
                      cells: [
                        DataCell(Text(account.url)),
                        DataCell(Text(account.username)),
                        DataCell(ClickToReveal(child: Text(account.password))),
                        DataCell(
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.blueAccent,
                                ),
                                onPressed: () async {
                                  onEditPressed(account);
                                },
                              ),
                              IconButton(
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () async {
                                  final result =
                                      await DialogService().confirmation(
                                    "Are you sure you want to delete this record?",
                                  );

                                  if (result == true) {
                                    account.delete();
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onEditPressed(AccountModel account) {
    DialogService().modalSheet(
      body: (context) => AccountForm(
        title: "Edit Account",
        initialAccount: account,
        onSave: (context, account) {
          account.save();
          Navigator.pop(context);
        },
        onCancel: (context) {
          Navigator.pop(context);
        },
      ),
    );
  }

  void onAddPressed() {
    DialogService().modalSheet(
      body: (context) => AccountForm(
        title: "Add New Account",
        onSave: (context, account) {
          widget.box.add(account);
          Navigator.pop(context);
        },
        onCancel: (context) {
          Navigator.pop(context);
        },
      ),
    );
  }
}

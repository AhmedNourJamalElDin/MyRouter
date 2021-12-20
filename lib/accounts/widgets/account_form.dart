import 'package:flutter/material.dart';
import 'package:router_setting/accounts/models/account.model.dart';
import 'package:router_setting/core/extensions/index.dart';
import 'package:separated_column/separated_column.dart';
import 'package:separated_row/separated_row.dart';

class AccountForm extends StatefulWidget {
  final AccountModel? initialAccount;
  final void Function(BuildContext context, AccountModel account) onSave;
  final void Function(BuildContext context)? onCancel;
  final String? title;

  const AccountForm({
    Key? key,
    required this.onSave,
    this.onCancel,
    this.initialAccount,
    this.title,
  }) : super(key: key);

  @override
  State<AccountForm> createState() => _AccountFormState();
}

class _AccountFormState extends State<AccountForm> {
  final formKey = GlobalKey<FormState>();

  final urlController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  late final AccountModel account;

  @override
  void initState() {
    super.initState();

    account = widget.initialAccount ??
        AccountModel(
          url: '',
          password: '',
          username: '',
        );

    urlController.text = account.url;
    usernameController.text = account.username;
    passwordController.text = account.password;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: SeparatedColumn(
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          children: [
            if (widget.title != null) ...[
              Text(
                widget.title!,
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(height: 15),
            ],
            TextFormField(
              controller: urlController,
              validator: (value) {
                if (value.isNullOrEmpty) {
                  return "This field is required";
                }

                return null;
              },
              decoration: const InputDecoration(
                labelText: "URL",
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              controller: usernameController,
              validator: (value) {
                if (value.isNullOrEmpty) {
                  return "This field is required";
                }

                return null;
              },
              decoration: const InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            SeparatedRow(
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              children: [
                Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {
                      widget.onCancel?.call(context);
                    },
                    child: const Text("Cancel"),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }

                      account
                        ..username = usernameController.text
                        ..password = passwordController.text
                        ..url = urlController.text;

                      widget.onSave(context, account);
                    },
                    child: const Text("Save"),
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

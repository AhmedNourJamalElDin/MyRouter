import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:router_setting/accounts/models/account.model.dart';
import 'package:router_setting/accounts/services/accounts.service.dart';
import 'package:router_setting/auth/services/auth.service.dart';
import 'package:router_setting/auth/widgets/account_drop_down_field.dart';
import 'package:router_setting/core/extensions/index.dart';
import 'package:separated_column/separated_column.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController();
  final urlController = TextEditingController();
  final passwordController = TextEditingController();

  final accountsService = AccountsService();
  late Box<AccountModel> accounts;

  bool isPasswordRevealed = false;

  final textFieldFocusNode = FocusNode();

  final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    await AuthService.instance.login(
      urlController.text,
      usernameController.text,
      passwordController.text,
    );
  }

  @override
  void initState() {
    super.initState();

    initDropDown();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SeparatedColumn(
        separatorBuilder: (_, __) => const SizedBox(height: 20),
        children: [
          if (accounts.isNotEmpty)
            AccountDropDownField(
              values: accounts.values,
              onChanged: onSelectedAccount,
            ),
          TextFormField(
            validator: (val) {
              if (val.isNullOrEmpty) {
                return "This field is required";
              }

              return null;
            },
            decoration: const InputDecoration(
              labelText: "URL",
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.deepOrange,
                ),
              ),
            ),
            controller: urlController,
          ),
          TextFormField(
            validator: (val) {
              if (val.isNullOrEmpty) {
                return "This field is required";
              }

              return null;
            },
            decoration: const InputDecoration(
              labelText: "Username",
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.deepOrange,
                ),
              ),
            ),
            controller: usernameController,
          ),
          TextFormField(
            focusNode: textFieldFocusNode,
            decoration: InputDecoration(
              labelText: "Password",
              suffix: InkWell(
                child: Icon(
                  isPasswordRevealed ? Icons.visibility_off : Icons.visibility,
                ),
                onTap: () {
                  // Unfocus all focus nodes
                  textFieldFocusNode.unfocus();

                  // Disable text field's focus node request
                  textFieldFocusNode.canRequestFocus = false;

                  //Enable the text field's focus node request after some delay
                  Future.delayed(const Duration(milliseconds: 100), () {
                    textFieldFocusNode.canRequestFocus = true;
                  });

                  isPasswordRevealed = !isPasswordRevealed;
                  setState(() {});
                },
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.deepOrange,
                ),
              ),
            ),
            obscureText: !isPasswordRevealed,
            controller: passwordController,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: login,
              child: const Text("Login"),
            ),
          ),
        ],
      ),
    );
  }

  void onSelectedAccount(AccountModel? account) {
    if (account == null) {
      return;
    }

    urlController.text = account.url;
    usernameController.text = account.username;
    passwordController.text = account.password;
  }

  Future<void> initDropDown() async {
    accounts = accountsService.box;

    final info = NetworkInfo();
    var gatewayIp = await info.getWifiGatewayIP();

    AccountModel? account;
    if(gatewayIp != null) {
      account = accountsService.firstByGatewayIp(gatewayIp);
    }

    if(accounts.isNotEmpty){
      onSelectedAccount(account ?? accounts.values.first);
    }
  }
}

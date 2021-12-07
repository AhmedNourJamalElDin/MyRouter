import 'package:flutter/material.dart';
import 'package:router_setting/auth/services/auth.service.dart';
import 'package:separated_column/separated_column.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController(text: 'admin');
  final passwordController =
  TextEditingController(text: 'd41d8cd98f00b204e9800998ecf8427e');

  Future<void> login() async {
    await AuthService.instance.login(
      usernameController.text,
      passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SeparatedColumn(
      separatorBuilder: (_, __) => SizedBox(height: 20),
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: "Username",
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.deepOrange,
              ),
            ),
          ),
          controller: usernameController,
        ),
        TextField(
          decoration: InputDecoration(
            labelText: "Password",
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.deepOrange,
              ),
            ),
          ),
          obscureText: true,
          controller: passwordController,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: login,
            child: Text("Login"),
          ),
        ),
      ],
    );
  }
}

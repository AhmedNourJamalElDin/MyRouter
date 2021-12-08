import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:router_setting/auth/widgets/login.dart';
import 'package:router_setting/core/widgets/logo.dart';
import 'package:router_setting/core/widgets/max_height_single_child_scroll_view.dart';
import 'package:separated_column/separated_column.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MaxHeightSingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: SeparatedColumn(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            separatorBuilder: (_, __) => SizedBox(height: 20),
            children: [
              Logo(),
              Login(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:router_setting/main.dart';

class DialogService {
  static Future<dynamic> error(String message,
      {String? subtitle, BuildContext? context}) {
    var dialog = AwesomeDialog(
      context: context ?? navigatorKey.currentContext!,
      animType: AnimType.SCALE,
      dialogType: DialogType.ERROR,
      body: Center(
        child: Column(
          children: [
            Text(
              message,
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            if (subtitle != null) Text(subtitle),
          ],
        ),
      ),
      btnOkOnPress: () {},
    );
    return dialog.show();
  }
  static Future<dynamic> success(String message,
      {String? subtitle, BuildContext? context}) {
    return AwesomeDialog(
      context: context ?? navigatorKey.currentContext!,
      animType: AnimType.SCALE,
      dialogType: DialogType.SUCCES,
      body: Center(
        child: Column(
          children: [
            Text(
              message,
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            if (subtitle != null) Text(subtitle),
          ],
        ),
      ),
      btnOkOnPress: () {},
    ).show();
  }
}

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:router_setting/main.dart';

class DialogService {
  Future<dynamic> error(
    String message, {
    String? subtitle,
    BuildContext? context,
  }) {
    return AwesomeDialog(
      context: context ?? navigatorKey.currentContext!,
      animType: AnimType.SCALE,
      dialogType: DialogType.ERROR,
      body: Center(
        child: Column(
          children: [
            Text(
              message,
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            if (subtitle != null) Text(subtitle),
          ],
        ),
      ),
      btnOkOnPress: () {},
    ).show();
  }

  Future<dynamic> success(
    String message, {
    String? subtitle,
    BuildContext? context,
  }) {
    return AwesomeDialog(
      context: context ?? navigatorKey.currentContext!,
      animType: AnimType.SCALE,
      dialogType: DialogType.SUCCES,
      body: Center(
        child: Column(
          children: [
            Text(
              message,
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            if (subtitle != null) Text(subtitle),
          ],
        ),
      ),
      btnOkOnPress: () {},
    ).show();
  }

  Future<bool> confirmation(
    String message, {
    String? subtitle,
    BuildContext? context,
  }) async {
    context = context ?? navigatorKey.currentContext!;

    late DismissType result;

    await AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.INFO,
      body: Center(
        child: Column(
          children: [
            Text(
              message,
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            if (subtitle != null) Text(subtitle),
          ],
        ),
      ),
      btnOkOnPress: () {},
      btnCancelOnPress: () {},
      onDissmissCallback: (type) {
        result = type;
      },
    ).show();

    return result == DismissType.BTN_OK;
  }

  void modalSheet({
    required WidgetBuilder body,
    BuildContext? context,
  }) {
    showModalBottomSheet(
      context: context ?? navigatorKey.currentContext!,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      builder: (context) => FractionallySizedBox(
        heightFactor: 0.7,
        child: Scaffold(body: body(context)),
      ),
    );
  }

  Future<void> successAfter(String message, {Duration duration = const Duration(seconds: 1),}) async {
    return Future.delayed(duration, () async {
      return success(message);
    });
  }
}

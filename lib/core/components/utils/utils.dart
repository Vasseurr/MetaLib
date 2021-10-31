import 'package:flutter/material.dart';

import '../../extension/context_extension.dart';

class Utils {
  static Utils _instance = Utils._init();
  static Utils get instance => _instance;
  Utils._init();

  void showAlert(BuildContext context,
      {required String title, required String content}) {
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        content: Text(content),
        actions: <Widget>[
          // ignore: deprecated_member_use
          FlatButton(
            child: const Text('Kapat'),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop('dialog');
            },
          )
        ],
      ),
    );
  }

  void showSnackBar(BuildContext context, {required String content}) {
    final snackBar = SnackBar(
        backgroundColor: context.colors.primary,
        content: Text(content.toString()));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

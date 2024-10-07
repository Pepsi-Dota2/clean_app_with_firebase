import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void failureDialog({required BuildContext context, required String message}) {
  Alert(
    context: context,
    type: AlertType.error,
    title: "Message",
    desc: message,
    buttons: [
      DialogButton(
        onPressed: () => Navigator.pop(context),
        width: 120,
        child: const Text(
          "Close",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      )
    ],
  ).show();
}

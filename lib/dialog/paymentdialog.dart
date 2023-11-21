import 'package:flutter/material.dart';

Future<void> PaymentDialog(BuildContext context, String titulo,
    String descricao, String ?button) async {
  await showDialog(
    context: context,
    builder: (alertDialogContext) {
      return AlertDialog(
        title: Text(titulo),
        content: Text(descricao),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(alertDialogContext),
            child: Text(button ?? 'OK'),
          ),
        ],
      );
    },
  );
}

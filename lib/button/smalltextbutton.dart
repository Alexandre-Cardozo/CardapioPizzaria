import 'package:flutter/material.dart';

class SmallTextButton extends StatelessWidget {
  const SmallTextButton(
      {super.key, required this.text, required this.onPressed});

  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xF7AE1C1E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            fixedSize: const Size(150.0, 40.0)),
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Readex Pro',
            color: Color(0xFFF2F2F2),
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

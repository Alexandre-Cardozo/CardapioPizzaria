import 'package:flutter/material.dart';

class PointedBar extends StatelessWidget {
  const PointedBar({super.key, required this.text, this.exibePoint});

  final String text;
  final bool? exibePoint;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 50.0,
        decoration: const BoxDecoration(
          color: Color(0xFF57636C),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Visibility(
              visible: exibePoint ?? true,
              child: const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Icon(
                  Icons.circle_rounded,
                  color: Color(0xF7AE1C1E),
                  size: 24.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                text,
                style: const TextStyle(
                  fontFamily: 'Readex Pro',
                  color: Color(0xFFF2F2F2),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

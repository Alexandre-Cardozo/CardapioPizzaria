import 'package:flutter/material.dart';

class IconedTextButton extends StatefulWidget {
  const IconedTextButton(
      {super.key, required this.text, required this.icon, this.onPressed});

  final String text;
  final IconData icon;
  final Function()? onPressed;

  @override
  State<IconedTextButton> createState() => _IconedTextButtonState();
}

class _IconedTextButtonState extends State<IconedTextButton> {
  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            if (!isToggled) widget.onPressed!();
            isToggled = !isToggled;
          });
        },
        style: ElevatedButton.styleFrom(
            backgroundColor:
                isToggled ? const Color(0xff087416) : const Color(0xF7AE1C1E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            fixedSize: const Size(300.0, 40.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              size: 20.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            Text(
              widget.text,
              style: const TextStyle(
                fontFamily: 'Readex Pro',
                color: Color(0xFFF2F2F2),
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}

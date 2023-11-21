import 'package:flutter/material.dart';

class IconedTextButton extends StatefulWidget {
  const IconedTextButton(
      {super.key,
      required this.text,
      required this.icon,
      this.onPressed,
      required this.isToggled});

  final String text;
  final IconData icon;
  final Function()? onPressed;
  final bool isToggled;

  @override
  State<IconedTextButton> createState() => _IconedTextButtonState();
}

class _IconedTextButtonState extends State<IconedTextButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Opacity(
        opacity: widget.isToggled ? 1.0 : 0.5,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              if (widget.onPressed != null && !widget.isToggled) {
                widget.onPressed!();
              }
            });
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xF7AE1C1E),
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
      ),
    );
    ;
  }
}

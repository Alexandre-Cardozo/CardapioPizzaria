import 'package:flutter/material.dart';

class IconedButton extends StatelessWidget {
  const IconedButton(
      {super.key, required this.icon, this.onPressed, this.color, this.size});

  final IconData icon;
  final Function()? onPressed;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.0,
      height: 60.0,
      child: Theme(
        data: Theme.of(context).copyWith(useMaterial3: true),
        child: IconButton(
            icon: Icon(
              icon,
              color: color ?? Colors.white,
              size: size ?? 30.0,
            ),
            onPressed: onPressed),
      ),
    );
  }
}

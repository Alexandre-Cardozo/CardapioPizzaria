import 'package:flutter/material.dart';

import '../button/iconedbutton.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar(
      {super.key,
      required this.firstIcon,
      this.firstOnPressed,
      required this.secondIcon,
      this.secondOnPressed,
      required this.title});

  final IconData firstIcon;
  final Function()? firstOnPressed;
  final IconData secondIcon;
  final Function()? secondOnPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: const Color(0xF7AE1C1E),
        leading: IconedButton(icon: firstIcon, onPressed: firstOnPressed),
        title: Text(title,
            style: const TextStyle(
                fontFamily: 'Outfit',
                color: Color(0xFFF2F2F2),
                fontSize: 24.0,
                fontWeight: FontWeight.bold)),
        actions: [IconedButton(icon: secondIcon, onPressed: secondOnPressed)],
        centerTitle: true,
        elevation: 10.0);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

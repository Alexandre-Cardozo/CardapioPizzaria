import 'package:flutter/material.dart';
import 'dart:core';

class ButtonBack extends StatelessWidget {
  final IconData? iconData;
  final VoidCallback? click;
  final Alignment alignment;

  const ButtonBack({
    super.key,
    required this.click,
    required this.iconData,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: InkWell(
        onTap: click,
        child: Container(
          // padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
          margin: const EdgeInsets.only(top: 33),
          padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 20, 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(_checkButtonSide()[0]),
                bottomLeft: Radius.circular(_checkButtonSide()[1]),
                topRight: Radius.circular(_checkButtonSide()[2]),
                bottomRight: Radius.circular(_checkButtonSide()[3])),
            color: Colors.blue,
          ),
          height: 78,
          child: Icon(iconData),
        ),
      ),
    );
  }

  _checkButtonSide() {
    if(alignment == Alignment.centerRight) {
      return [30.0, 30.0, 0.0, 0.0];
    }
    return [0.0, 0.0, 30.0, 30.0];
  }

}

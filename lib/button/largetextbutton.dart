import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

class LargeTextButton extends StatelessWidget {
  const LargeTextButton(
      {super.key, required this.text, required this.onPressed});

  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xF7AE1C1E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            fixedSize: const Size(300.0, 40.0)),
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

/*Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 60.0, 20.0, 0.0),
      child: FFButtonWidget(
        onPressed: () async {
          context.pushNamed('MeuPedido');
        },
        text: text,
        options: FFButtonOptions(
          height: 40.0,
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
          color: Color(0xF7AE1C1E),
          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                fontFamily: 'Readex Pro',
                color: Color(0xFFF2F2F2),
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
          elevation: 3.0,
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );*/
}

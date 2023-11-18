import 'package:flutter/material.dart';

import '../button/iconedbutton.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.icon, this.onPressed});

  final IconData icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
      child: Card(
        color: FlutterFlowTheme.of(context).primaryBackground,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: Column(
            children: [
              const Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text('Nome',
                      style: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Color(0xFFF2F2F2),
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              const Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                    'Descricao, Descricao, Descricao, Descricao, Descricao, Descricao, Descricao, Descricao, Descricao, Descricao, Descricao, Descricao',
                    style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Color(0xFFF2F2F2),
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text('R\$ Preço',
                        style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFF39D254),
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: IconedButton(
                      icon: icon,
                      size: 45,
                      color: const Color(0xF7AE1C1E),
                      onPressed: onPressed,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../button/smalltextbutton.dart';

class CardMenuPedido extends StatelessWidget {
  const CardMenuPedido({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
      child: Card(
        color: Colors.white,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            children: [
              const Align(
                alignment: AlignmentDirectional.centerStart,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Pedido:',
                        style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFFC2C2C2),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold)),
                    Text('00000',
                        style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFFC2C2C2),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              const Align(
                alignment: AlignmentDirectional.centerStart,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Mesa:',
                        style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFFC2C2C2),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold)),
                    Text('000',
                        style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFFC2C2C2),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              const Align(
                alignment: AlignmentDirectional.centerStart,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Pagamento:',
                        style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFFC2C2C2),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold)),
                    Text('Garçom',
                        style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFFC2C2C2),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              const Align(
                alignment: AlignmentDirectional.centerStart,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Valor do Pedido:',
                        style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFFC2C2C2),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold)),
                    Text('R\$ 00,00',
                        style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFFC2C2C2),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SmallTextButton(
                    text: "Finalizar",
                    onPressed: () async {},
                  ),
                  SmallTextButton(
                    text: "Cancelar",
                    onPressed: () async {},
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

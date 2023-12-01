import 'package:flutter/material.dart';

class CardHistorico extends StatelessWidget {
  const CardHistorico({super.key});

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
        child: const Padding(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            children: [
              Align(
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
              Align(
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
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Data/Hora:',
                          style: TextStyle(
                              fontFamily: 'Readex Pro',
                              color: Color(0xFFC2C2C2),
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold)),
                      Text('dd/MM/yyyy',
                          style: TextStyle(
                              fontFamily: 'Readex Pro',
                              color: Color(0xFFC2C2C2),
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('hh:mm:ss',
                          style: TextStyle(
                              fontFamily: 'Readex Pro',
                              color: Color(0xFFC2C2C2),
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Status:',
                        style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFFC2C2C2),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold)),
                    Text('Finalizado',
                        style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Color(0xB339D254),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

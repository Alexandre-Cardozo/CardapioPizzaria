import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../button/largetextbutton.dart';

class CardMesa extends StatelessWidget {
  const CardMesa({super.key});

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
              Align(
                alignment: AlignmentDirectional.center,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 200.0,
                        height: 100.0,
                        color: const Color(0xFF57636C),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Mesa',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                color: Color(0xFFF2F2F2),
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '021',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                color: Color(0xFFF1F4F8),
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 100.0,
                        height: 100.0,
                        color: const Color(0xFF898C8F),
                        child:
                            QrImageView(data: "001", version: QrVersions.auto),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LargeTextButton(
                    text: "Excluir",
                    onPressed: () async {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

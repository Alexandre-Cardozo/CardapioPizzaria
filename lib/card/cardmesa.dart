import 'package:flutter/material.dart';
import 'package:pizza_hut/components/menu_mesas/menu_mesas.dart';
import 'package:pizza_hut/controllers/table_controller.dart';
import 'package:pizza_hut/models/table_model.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../button/largetextbutton.dart';

class CardMesa extends StatelessWidget {
  final TableUser tableUser;

  const CardMesa({super.key, required this.tableUser});

  @override
  Widget build(BuildContext context) {
    final TableController tableController = TableController();

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
      child: Card(
        color: Colors.white,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 0),
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Mesa',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                color: Color(0xFFF2F2F2),
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              tableUser.numberTable,
                              style: const TextStyle(
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
                            QrImageView(data: tableUser.numberTable, version: QrVersions.auto),
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
                    onPressed: () async {
                      await tableController.deleteTable(tableUser.tableId);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MenuMesas()),
                      );
                    },
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

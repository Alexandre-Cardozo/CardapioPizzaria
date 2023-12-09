import 'package:flutter/material.dart';
import 'package:pizza_hut/components/menu_gerenciamento/menu_gerenciamento.dart';
import 'package:pizza_hut/controllers/table_controller.dart';
import 'package:pizza_hut/models/table_model.dart';

import '../../bar/defaultappbar.dart';
import '../../button/largetextbutton.dart';
import '../../card/cardmesa.dart';

class MenuMesas extends StatefulWidget {
  const MenuMesas({super.key});

  @override
  State<MenuMesas> createState() => _MenuMesasState();
}

class _MenuMesasState extends State<MenuMesas> {
  final TableController _tableController = TableController();

  Future<void> loadTables() async {
    await _tableController.getAllTables();
  }

  @override
  void initState() {
    super.initState();
    loadTables();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(
          firstIcon: Icons.arrow_back_rounded,
          title: "Menu Mesas",
          firstOnPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MenuGerenciamento(),
              ),
            );
          }),
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: LargeTextButton(
                text: "Criar Mesa",
                onPressed: () async {
                  TableUser table = TableUser(numberTable: '001');
                  await _tableController.createTable(table);
                  await loadTables();
                },
              ),
            ),
            StreamBuilder<List<TableUser>>(
                stream: _tableController.tableStream,
                builder: (context, snapshot) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data?.length,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        if (snapshot.hasData) {
                          final tableUser = snapshot.data![index];
                          return Column(
                            children: [
                              CardMesa(tableUser: tableUser),
                            ],
                          );
                        } else {
                          return null;
                        }
                      },
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

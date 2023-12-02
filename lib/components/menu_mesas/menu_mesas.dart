import 'package:flutter/material.dart';
import 'package:pizza_hut/components/menu_gerenciamento/menu_gerenciamento.dart';

import '../../bar/defaultappbar.dart';
import '../../button/largetextbutton.dart';
import '../../card/cardmesa.dart';

class MenuMesas extends StatefulWidget {
  const MenuMesas({super.key});

  @override
  State<MenuMesas> createState() => _MenuMesasState();
}

class _MenuMesasState extends State<MenuMesas> {
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
                onPressed: () async {},
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: const [
                  CardMesa(),
                  CardMesa(),
                  CardMesa(),
                  CardMesa(),
                  CardMesa(),
                  CardMesa(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

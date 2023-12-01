import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_hut/card/cardmenuproduto.dart';

import '../../bar/defaultappbar.dart';
import '../../button/largetextbutton.dart';

class MenuProdutos extends StatefulWidget {
  const MenuProdutos({super.key});

  @override
  State<MenuProdutos> createState() => _MenuProdutosState();
}

class _MenuProdutosState extends State<MenuProdutos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(
          firstIcon: Icons.arrow_back_rounded,
          title: "Menu Produtos",
          firstOnPressed: () {
            context.pushNamed('MenuGerenciamento');
          }),
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: LargeTextButton(
                text: "Criar Produto",
                onPressed: () async {},
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: const [
                  CardMenuProduto(),
                  CardMenuProduto(),
                  CardMenuProduto(),
                  CardMenuProduto(),
                  CardMenuProduto(),
                  CardMenuProduto(),
                  CardMenuProduto(),
                  CardMenuProduto(),
                  CardMenuProduto(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}

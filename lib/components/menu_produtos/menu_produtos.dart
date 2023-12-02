import 'package:flutter/material.dart';
import 'package:pizza_hut/card/cardmenuproduto.dart';
import 'package:pizza_hut/components/menu_gerenciamento/menu_gerenciamento.dart';

import '../../bar/defaultappbar.dart';
import '../../button/largetextbutton.dart';
import '../registrar_produto/registrar_produto.dart';

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
                text: "Criar Produto",
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegistrarProduto(),
                    ),
                  );
                },
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
  }
}

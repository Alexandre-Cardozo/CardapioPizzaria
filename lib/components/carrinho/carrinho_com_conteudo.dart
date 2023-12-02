import 'package:flutter/material.dart';
import 'package:pizza_hut/bar/pointedbar.dart';

import '../../bar/defaultappbar.dart';
import '../../button/largetextbutton.dart';
import '../../card/cardremove.dart';
import '../menu/menu.dart';
import '../pedido/pedido.dart';

class CarrinhoComConteudo extends StatefulWidget {
  const CarrinhoComConteudo({super.key});

  @override
  State<CarrinhoComConteudo> createState() => _CarrinhoComConteudoState();
}

class _CarrinhoComConteudoState extends State<CarrinhoComConteudo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(
          firstIcon: Icons.arrow_back_rounded,
          title: "Carrinho",
          firstOnPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Menu(),
              ),
            );
          }),
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            PointedBar(text: "Produtos"),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: const [
                  CardItemRemove(),
                  CardItemRemove(),
                  CardItemRemove(),
                  CardItemRemove(),
                  CardItemRemove(),
                  CardItemRemove(),
                  CardItemRemove(),
                  CardItemRemove(),
                  CardItemRemove()
                ],
              ),
            ),
            LargeTextButton(
              text: "Escolher forma de Pagamento",
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Pedido(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

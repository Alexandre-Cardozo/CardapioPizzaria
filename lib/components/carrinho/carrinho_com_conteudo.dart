import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_hut/bar/pointedbar.dart';

import '../../bar/defaultappbar.dart';
import '../../button/largetextbutton.dart';
import '../../card/cardremove.dart';
import '../../flutter_flow/flutter_flow_theme.dart';

class CarrinhoComConteudo extends StatefulWidget {
  const CarrinhoComConteudo({super.key});

  @override
  State<CarrinhoComConteudo> createState() => _CarrinhoComConteudoState();
}

class _CarrinhoComConteudoState extends State<CarrinhoComConteudo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: DefaultAppBar(
          firstIcon: Icons.arrow_back_rounded,
          title: "Carrinho",
          firstOnPressed: () {
            context.pushNamed('Menu');
          }),
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            const PointedBar(text: "Produtos"),
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
                context.pushNamed('Pedido');
              },
            )
          ],
        ),
      ),
    );
  }
}

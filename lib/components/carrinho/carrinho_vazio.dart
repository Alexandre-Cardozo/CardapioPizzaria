import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../bar/defaultappbar.dart';
import '../../button/largetextbutton.dart';
import '../../flutter_flow/flutter_flow_theme.dart';

class CarrinhoVazio extends StatefulWidget {
  const CarrinhoVazio({super.key});

  @override
  State<CarrinhoVazio> createState() => _CarrinhoVazioState();
}

class _CarrinhoVazioState extends State<CarrinhoVazio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(
          firstIcon: Icons.arrow_back_rounded,
          title: "Carrinho",
          firstOnPressed: () {
            context.pushNamed('Menu');
          }),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      'O CARRINHO ESTÁ VAZIO!\n\nPara continuar selecione ao menos um item ao carrinho.',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: const Color(0xF7AE1C1E),
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Image.asset(
                    'assets/images/pizza_hut.jpg',
                    width: 350.0,
                    height: 400.0,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            LargeTextButton(
              text: "Ir para Carrinho com Itens",
              onPressed: () async {
                context.pushNamed('CarrinhoComConteudo');
              },
            )
          ],
        ),
      ),
    );
  }
}

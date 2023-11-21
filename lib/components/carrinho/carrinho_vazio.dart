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
    var orientation = MediaQuery.of(context).orientation;
    bool isPortrait = orientation == Orientation.portrait;

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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          textAlign: TextAlign.center,
                          'O CARRINHO ESTÁ VAZIO!\n\nPara continuar selecione ao menos um item ao carrinho.',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: const Color(0xF7AE1C1E),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/images/pizza_hut.jpg',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
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

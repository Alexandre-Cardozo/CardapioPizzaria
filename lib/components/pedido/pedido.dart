import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_hut/button/iconedtextbutton.dart';
import 'package:pizza_hut/dialog/paymentdialog.dart';

import '../../bar/defaultappbar.dart';
import '../../bar/pointedbar.dart';
import '../../button/largetextbutton.dart';
import '../../flutter_flow/flutter_flow_theme.dart';

class Pedido extends StatefulWidget {
  const Pedido({super.key});

  @override
  State<Pedido> createState() => _PedidoState();
}

class _PedidoState extends State<Pedido> {
  final TextEditingController _observacoesController = TextEditingController();
  final TextEditingController _pagamentoController = TextEditingController();
  String formaPagamento = 'PIX';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: DefaultAppBar(
          firstIcon: Icons.arrow_back_rounded,
          title: "Pedido",
          firstOnPressed: () {
            context.pushNamed('CarrinhoComConteudo');
          }),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Column(children: [
                          const PointedBar(text: "Forma de Pagamento"),
                          IconedTextButton(
                            text: "PIX",
                            icon: Icons.pix,
                            onPressed: () {
                              PaymentDialog(
                                context,
                                "Método de Pagamento",
                                "Será gerado um QR CODE com um código para pagamento via PIX!\n\nGeração após FINALIZAR PEDIDO.",
                                "OK",
                              );
                              updateFormaPagamento('PIX');
                            },
                          ),
                          IconedTextButton(
                            text: "GARÇOM",
                            icon: Icons.person,
                            onPressed: () {
                              PaymentDialog(
                                context,
                                "Método de Pagamento",
                                "Você poderá realizar o pagamento através do GARÇOM ou pelo CAIXA!",
                                "OK",
                              );
                              updateFormaPagamento('GARÇOM');
                            },
                          ),
                        ]),
                        Column(
                          children: [
                            const PointedBar(text: "Confirmar Pedido"),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding:
                                  const EdgeInsets.only(left: 10, bottom: 10),
                              child: Text(
                                'Valor Total do Pedido: \nR\$: ' '0,00',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding:
                                  const EdgeInsets.only(left: 10, bottom: 5),
                              child: TextFormField(
                                  controller: _pagamentoController,
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    hintText: 'Forma de Pagamento: \nModo: PIX',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  maxLines: 2,
                                  enabled: false,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Readex Pro',
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const PointedBar(text: "Observações do Pedido"),
                            TextFormField(
                              controller: _observacoesController,
                              autofocus: false,
                              decoration: InputDecoration(
                                hintText:
                                    'Insira as aqui observações do Pedido',
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                contentPadding: const EdgeInsets.all(10),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            LargeTextButton(
              text: "Finalizar Pedido",
              onPressed: () async {
                if (formaPagamento == 'PIX') {
                  context.pushNamed('PagamentoPorPix');
                } else {
                  context.pushNamed('Menu');
                }
              },
            )
          ],
        ),
      ),
    );
  }

  void updateFormaPagamento(String forma) {
    setState(() {
      formaPagamento = forma;
      _pagamentoController.text = 'Forma de Pagamento: \nModo: $formaPagamento';
    });
  }
}

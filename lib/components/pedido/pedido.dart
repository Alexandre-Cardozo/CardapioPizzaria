import 'package:flutter/material.dart';
import 'package:pizza_hut/button/iconedtextbutton.dart';
import 'package:pizza_hut/components/carrinho/carrinho_com_conteudo.dart';
import 'package:pizza_hut/dialog/paymentdialog.dart';

import '../../bar/defaultappbar.dart';
import '../../bar/pointedbar.dart';
import '../../button/largetextbutton.dart';
import '../menu/menu.dart';
import '../pix/pix.dart';

class Pedido extends StatefulWidget {
  const Pedido({super.key});

  @override
  State<Pedido> createState() => _PedidoState();
}

class _PedidoState extends State<Pedido> {
  final TextEditingController _observacoesController = TextEditingController();
  final TextEditingController _pagamentoController = TextEditingController();
  String forma = 'PIX';
  bool isPixSelected = true;
  bool isGarcomSelected = false;
  double valorTotalPedido = 0.11;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(
          firstIcon: Icons.arrow_back_rounded,
          title: "Pedido",
          firstOnPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CarrinhoComConteudo(),
              ),
            );
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
                          PointedBar(text: "Forma de Pagamento"),
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
                            isToggled: isPixSelected,
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
                            isToggled: isGarcomSelected,
                          ),
                        ]),
                        Column(
                          children: [
                            PointedBar(text: "Confirmar Pedido"),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(left: 10),
                              child: TextFormField(
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    hintText:
                                        'Valor Total do Pedido: \nR\$: $valorTotalPedido',
                                    hintStyle: const TextStyle(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF57636C)),
                                  ),
                                  maxLines: 2,
                                  enabled: false,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Readex Pro',
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding:
                                  const EdgeInsets.only(left: 10, bottom: 5),
                              child: TextFormField(
                                  controller: _pagamentoController,
                                  autofocus: false,
                                  decoration: const InputDecoration(
                                    hintText: 'Forma de Pagamento: \nModo: PIX',
                                    hintStyle: TextStyle(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF57636C)),
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
                            PointedBar(text: "Observações do Pedido"),
                            TextFormField(
                              controller: _observacoesController,
                              autofocus: false,
                              decoration: const InputDecoration(
                                hintText:
                                    'Insira as aqui observações do Pedido',
                                hintStyle: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFF57636C),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                ),
                                contentPadding: EdgeInsets.all(10),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF57636C),
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              style: const TextStyle(
                                fontFamily: 'Readex Pro',
                                color: Color(0xFF14181B),
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                              ),
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
                if (isPixSelected) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Pix(
                        chavePix: valorTotalPedido.toString(),
                      ),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Menu(),
                    ),
                  );
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
      isPixSelected = forma == 'PIX';
      isGarcomSelected = forma == 'GARÇOM';
      _pagamentoController.text = 'Forma de Pagamento: \nModo: $forma';
    });
  }
}

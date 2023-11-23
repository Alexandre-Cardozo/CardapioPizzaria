import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_hut/button/iconedbutton.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';

import '../../bar/defaultappbar.dart';
import '../../bar/pointedbar.dart';
import '../../dialog/paymentdialog.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../pedido/pedido.dart';

class Pix extends StatefulWidget {
  Pix({super.key, this.chavePix});

  String? chavePix;
  int seconds = 5;

  @override
  State<Pix> createState() => _PixState();
}

class _PixState extends State<Pix> {
  late TextEditingController _chavePIXController;
  late TextEditingController _countdownController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _chavePIXController = TextEditingController(text: "${widget.chavePix}");
    _countdownController = TextEditingController(text: '${widget.seconds} seg');
    startCountdown();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: DefaultAppBar(
          firstIcon: Icons.arrow_back_rounded,
          title: "Pagamento",
          firstOnPressed: () {
            context.pushNamed('Pedido');
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
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        alignment: Alignment.center,
                        child: QrImageView(
                          data: "${widget.chavePix}",
                          version: QrVersions.auto,
                          size: 330.0,
                          padding: const EdgeInsets.all(20),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Chave PIX:",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: _chavePIXController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintStyle: FlutterFlowTheme.of(context).labelMedium,
                            contentPadding:
                                const EdgeInsets.only(left: 10, right: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                width: 2.0,
                              ),
                            ),
                          ),
                          enabled: false,
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          maxLines: null,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Copiar Chave:",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                        IconedButton(
                          icon: Icons.copy,
                          color: Colors.black,
                          onPressed: _copyToClipboard,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            PointedBar(text: "Verificando Pagamento", exibePoint: false),
            Container(
              color: FlutterFlowTheme.of(context).alternate,
              height: MediaQuery.of(context).size.height / 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Esgota em:",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      height: 50,
                      width: 75,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        enabled: false,
                        controller: _countdownController,
                        style: const TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _copyToClipboard() {
    String chavePix = _chavePIXController.text;
    Clipboard.setData(ClipboardData(text: chavePix));
    Toast.show(
      'Chave PIX copiada para a área de transferência!',
      duration: 5,
      gravity: Toast.bottom,
      backgroundColor: const Color(0xF7AE1C1E),
    );
  }

  void startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (widget.seconds > 0) {
          //widget.seconds--;
          _countdownController.text = '${widget.seconds} seg';
        } else {
          PaymentDialog(
            context,
            "Pagamento",
            "Tempo expirado para efetuar o pegamento do Pedido!",
            "OK",
          );
          _timer.cancel();
          _showAlert();
        }
      });
    });
  }

  void _showAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Tempo Expirado!"),
          content: const Text("O tempo para o pagamento via PIX expirou."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Fecha o alerta
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Pedido()),
                );
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}

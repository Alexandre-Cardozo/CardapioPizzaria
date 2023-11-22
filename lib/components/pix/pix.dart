import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_hut/button/iconedbutton.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';

import '../../bar/defaultappbar.dart';
import '../../flutter_flow/flutter_flow_theme.dart';

class Pix extends StatefulWidget {
  Pix({super.key});

  final TextEditingController _chavePIXController = TextEditingController(
      text:
          "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
  final TextEditingController _countdownController =
      TextEditingController(text: "1 min 3 seg");

  @override
  State<Pix> createState() => _PixState();
}

class _PixState extends State<Pix> {
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: QrImageView(
                  data: '1234567890',
                  version: QrVersions.auto,
                  size: 330.0,
                  padding: const EdgeInsets.all(20),
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
                    controller: widget._chavePIXController,
                    decoration: InputDecoration(
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
                      contentPadding:
                          const EdgeInsets.only(left: 10, right: 10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).secondaryText,
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
              Container(
                color: FlutterFlowTheme.of(context).alternate,
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        "Verificando Pagamento",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.loop,
                          color: Colors.black,
                          size: 30.0,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Esgota em:",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _copyToClipboard() {
    String chavePix = widget._chavePIXController.text;
    Clipboard.setData(ClipboardData(text: chavePix));
    Toast.show(
      'Chave PIX copiada para a área de transferência!',
      duration: 5,
      gravity: Toast.bottom,
      backgroundColor: const Color(0xF7AE1C1E),
    );
  }
}

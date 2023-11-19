import 'package:pizza_hut/button/largetextbutton.dart';
import 'package:pizza_hut/card/cardremove.dart';
import 'package:pizza_hut/widgets/card_personalizado2_widget.dart';

import '../../appbar/defaultappbar.dart';
import '/button/iconedbutton.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'carrinho_com_conteudo_model.dart';
export 'carrinho_com_conteudo_model.dart';

class CarrinhoComConteudoWidget extends StatefulWidget {
  const CarrinhoComConteudoWidget({Key? key}) : super(key: key);

  @override
  _CarrinhoComConteudoWidgetState createState() =>
      _CarrinhoComConteudoWidgetState();
}

class _CarrinhoComConteudoWidgetState extends State<CarrinhoComConteudoWidget> {
  late CarrinhoComConteudoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarrinhoComConteudoModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: DefaultAppBar(
            firstIcon: Icons.arrow_back_rounded,
            title: "Carrinho",
            firstOnPressed: () async {
              context.pop();
            }),
        body: SafeArea(
          top: true,
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Itens do Pedido',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: const Color(0xF7AE1C1E),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
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
                  context.pushNamed('MeuPedido');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

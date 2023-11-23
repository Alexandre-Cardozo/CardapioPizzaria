import 'package:pizza_hut/widgets/card_personalizado3_widget.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'gerenciar_pedidos_model.dart';
export 'gerenciar_pedidos_model.dart';

class GerenciarPedidosWidget extends StatefulWidget {
  const GerenciarPedidosWidget({Key? key}) : super(key: key);

  @override
  _GerenciarPedidosWidgetState createState() => _GerenciarPedidosWidgetState();
}

class _GerenciarPedidosWidgetState extends State<GerenciarPedidosWidget> {
  late GerenciarPedidosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GerenciarPedidosModel());
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
        appBar: AppBar(
          backgroundColor: Color(0xF7AE1C1E),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Gerenciar Pedidos',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Color(0xFFF2F2F2),
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () {
                            context.pushNamed("HistoricoPedidos");
                          },
                          text: 'Histórico',
                          options: FFButtonOptions(
                            width: 260.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFFF2F2F2),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  wrapWithModel(
                    model: _model.cardPersonalizado3Model1,
                    updateCallback: () => setState(() {}),
                    child: CardPersonalizado3Widget(),
                  ),
                  wrapWithModel(
                    model: _model.cardPersonalizado3Model2,
                    updateCallback: () => setState(() {}),
                    child: CardPersonalizado3Widget(),
                  ),
                  wrapWithModel(
                    model: _model.cardPersonalizado3Model3,
                    updateCallback: () => setState(() {}),
                    child: CardPersonalizado3Widget(),
                  ),
                  wrapWithModel(
                    model: _model.cardPersonalizado3Model4,
                    updateCallback: () => setState(() {}),
                    child: CardPersonalizado3Widget(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

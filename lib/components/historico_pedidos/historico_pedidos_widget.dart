import 'package:pizza_hut/widgets/card_personalizado4_widget.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'historico_pedidos_model.dart';
export 'historico_pedidos_model.dart';

class HistoricoPedidosWidget extends StatefulWidget {
  const HistoricoPedidosWidget({Key? key}) : super(key: key);

  @override
  _HistoricoPedidosWidgetState createState() => _HistoricoPedidosWidgetState();
}

class _HistoricoPedidosWidgetState extends State<HistoricoPedidosWidget> {
  late HistoricoPedidosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistoricoPedidosModel());
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
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Histórico',
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
              wrapWithModel(
                model: _model.cardPersonalizado4Model1,
                updateCallback: () => setState(() {}),
                child: CardPersonalizado4Widget(),
              ),
              wrapWithModel(
                model: _model.cardPersonalizado4Model2,
                updateCallback: () => setState(() {}),
                child: CardPersonalizado4Widget(),
              ),
              wrapWithModel(
                model: _model.cardPersonalizado4Model3,
                updateCallback: () => setState(() {}),
                child: CardPersonalizado4Widget(),
              ),
              wrapWithModel(
                model: _model.cardPersonalizado4Model4,
                updateCallback: () => setState(() {}),
                child: CardPersonalizado4Widget(),
              ),
              wrapWithModel(
                model: _model.cardPersonalizado4Model5,
                updateCallback: () => setState(() {}),
                child: CardPersonalizado4Widget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

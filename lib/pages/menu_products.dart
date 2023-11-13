import '/components/card_personalizado5_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'menu_products_model.dart';
export 'menu_products_model.dart';

class MenuProductsWidget extends StatefulWidget {
  const MenuProductsWidget({Key? key}) : super(key: key);

  @override
  _MenuProductsWidgetState createState() => _MenuProductsWidgetState();
}

class _MenuProductsWidgetState extends State<MenuProductsWidget> {
  late MenuProductsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuProductsModel());
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
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Menu de Produtos',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
              fontFamily: 'Outfit',
              color: Color(0xFFF2F2F2),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Criar Produto',
                      options: FFButtonOptions(
                        width: 280,
                        height: 40,
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: Color(0xF7AE1C1E),
                        textStyle:
                        FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Color(0xFFF2F2F2),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        elevation: 3,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.cardPersonalizado5Model1,
                    updateCallback: () => setState(() {}),
                    child: CardPersonalizado5Widget(),
                  ),
                  wrapWithModel(
                    model: _model.cardPersonalizado5Model2,
                    updateCallback: () => setState(() {}),
                    child: CardPersonalizado5Widget(),
                  ),
                  wrapWithModel(
                    model: _model.cardPersonalizado5Model3,
                    updateCallback: () => setState(() {}),
                    child: CardPersonalizado5Widget(),
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

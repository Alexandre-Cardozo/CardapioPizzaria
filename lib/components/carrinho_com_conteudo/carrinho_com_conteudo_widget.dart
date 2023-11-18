import 'package:pizza_hut/widgets/card_personalizado2_widget.dart';

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
        appBar: AppBar(
          backgroundColor: const Color(0xF7AE1C1E),
          automaticallyImplyLeading: false,
          leading: IconedButton(
              icon: Icons.arrow_back_rounded,
              onPressed: () async {
                context.pop();
              }),
          title: Text(
            'Carrinho',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: const Color(0xFFF2F2F2),
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              Align(
                alignment: const AlignmentDirectional(-1.00, 0.00),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      20.0, 10.0, 0.0, 10.0),
                  child: Text(
                    'Produtos',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  wrapWithModel(
                    model: _model.cardPersonalizado2Model1,
                    updateCallback: () => setState(() {}),
                    child: CardPersonalizado2Widget(),
                  ),
                  wrapWithModel(
                    model: _model.cardPersonalizado2Model2,
                    updateCallback: () => setState(() {}),
                    child: CardPersonalizado2Widget(),
                  ),
                  wrapWithModel(
                    model: _model.cardPersonalizado2Model3,
                    updateCallback: () => setState(() {}),
                    child: CardPersonalizado2Widget(),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 60.0, 20.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed('MeuPedido');
                      },
                      text: 'Escolher Forma de Pagamento',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xF7AE1C1E),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFFF2F2F2),
                                  fontSize: 18.0,
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
            ],
          ),
        ),
      ),
    );
  }
}

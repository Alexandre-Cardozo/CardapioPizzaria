import 'package:pizza_hut/components/carrinho_com_conteudo/carrinho_com_conteudo_widget.dart';
import 'package:pizza_hut/widgets/card_personalizado_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pagina_inicial_model.dart';
export 'pagina_inicial_model.dart';

class PaginaInicialWidget extends StatefulWidget {
  const PaginaInicialWidget({Key? key}) : super(key: key);

  @override
  _PaginaInicialWidgetState createState() => _PaginaInicialWidgetState();
}

class _PaginaInicialWidgetState extends State<PaginaInicialWidget> {
  late PaginaInicialModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaginaInicialModel());
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
        backgroundColor: Colors.white,
        body: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: 391.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Color(0xF7AE1C1E),
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed('LoginAdministrador');
                          },
                          text: '',
                          icon: const Icon(
                            Icons.admin_panel_settings_outlined,
                            size: 15.0,
                          ),
                          options: FFButtonOptions(
                            height: 100.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xF7AE1C1E),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Container(
                            width: 228.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: Color(0xF7AE1C1E),
                            ),
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Mesa',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFFF2F2F2),
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.00, 0.00),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        '000',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: const AlignmentDirectional(0.00, 0.00),
                            child: FFButtonWidget(
                              onPressed: () {
                                context.pushNamed('CarrinhoComConteudo');
                              },
                              text: '\n',
                              icon: const Icon(
                                Icons.shopping_cart,
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                height: 100.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 10.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xF7AE1C1E),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/pizza_hut.jpg',
                  width: 300.0,
                  height: 319.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            wrapWithModel(
              model: _model.cardPersonalizadoModel1,
              updateCallback: () => setState(() {}),
              child: CardPersonalizadoWidget(),
            ),
            wrapWithModel(
              model: _model.cardPersonalizadoModel2,
              updateCallback: () => setState(() {}),
              child: CardPersonalizadoWidget(),
            ),
            wrapWithModel(
              model: _model.cardPersonalizadoModel3,
              updateCallback: () => setState(() {}),
              child: CardPersonalizadoWidget(),
            ),
            wrapWithModel(
              model: _model.cardPersonalizadoModel4,
              updateCallback: () => setState(() {}),
              child: CardPersonalizadoWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

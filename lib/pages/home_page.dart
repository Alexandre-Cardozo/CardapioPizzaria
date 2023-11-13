import '/components/card_personalizado_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
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
                    width: 391,
                    height: 100,
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
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: '',
                          icon: Icon(
                            Icons.admin_panel_settings_outlined,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            height: 100,
                            padding:
                            EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                            iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
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
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Container(
                            width: 228,
                            height: 100,
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
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        '000',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Readex Pro',
                                          color:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontSize: 22,
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
                            alignment: AlignmentDirectional(1.00, 0.00),
                            child: FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: '\n',
                              icon: Icon(
                                Icons.shopping_cart,
                                size: 15,
                              ),
                              options: FFButtonOptions(
                                height: 100,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 0, 24, 0),
                                iconPadding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
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
                                borderRadius: BorderRadius.circular(8),
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
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/pizza_hut.jpg',
                  width: 300,
                  height: 319,
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

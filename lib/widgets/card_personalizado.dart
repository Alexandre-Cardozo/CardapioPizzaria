import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'card_personalizado_model.dart';
export 'card_personalizado_model.dart';

class CardPersonalizadoWidget extends StatefulWidget {
  const CardPersonalizadoWidget({Key? key}) : super(key: key);

  @override
  _CardPersonalizadoWidgetState createState() =>
      _CardPersonalizadoWidgetState();
}

class _CardPersonalizadoWidgetState extends State<CardPersonalizadoWidget> {
  late CardPersonalizadoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardPersonalizadoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: FlutterFlowTheme.of(context).secondaryBackground,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: AlignmentDirectional(-1.00, -1.00),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5, 10, 0, 0),
              child: Text(
                'Nome',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5, 5, 0, 0),
              child: Text(
                'Descricao, Descricao, Descricao, Descricao, Descricao, Descricao, Descricao, Descricao, Descricao, Descricao, Descricao, Descricao',
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(-1.00, 1.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 10, 0, 20),
                  child: Text(
                    'R\$ Preço',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: Color(0xFF39D254),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(235, 0, 0, 0),
                  child: Icon(
                    Icons.add,
                    color: Color(0xF7AE1C1E),
                    size: 38,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

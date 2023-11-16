import 'package:pizza_hut/widgets/card_personalizado_model.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'pagina_inicial_widget.dart' show PaginaInicialWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaginaInicialModel extends FlutterFlowModel<PaginaInicialWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for CardPersonalizado component.
  late CardPersonalizadoModel cardPersonalizadoModel1;
  // Model for CardPersonalizado component.
  late CardPersonalizadoModel cardPersonalizadoModel2;
  // Model for CardPersonalizado component.
  late CardPersonalizadoModel cardPersonalizadoModel3;
  // Model for CardPersonalizado component.
  late CardPersonalizadoModel cardPersonalizadoModel4;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    cardPersonalizadoModel1 =
        createModel(context, () => CardPersonalizadoModel());
    cardPersonalizadoModel2 =
        createModel(context, () => CardPersonalizadoModel());
    cardPersonalizadoModel3 =
        createModel(context, () => CardPersonalizadoModel());
    cardPersonalizadoModel4 =
        createModel(context, () => CardPersonalizadoModel());
  }

  void dispose() {
    unfocusNode.dispose();
    cardPersonalizadoModel1.dispose();
    cardPersonalizadoModel2.dispose();
    cardPersonalizadoModel3.dispose();
    cardPersonalizadoModel4.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

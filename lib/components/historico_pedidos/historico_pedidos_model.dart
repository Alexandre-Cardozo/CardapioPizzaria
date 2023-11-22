import 'package:pizza_hut/widgets/card_personalizado4_model.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'historico_pedidos_widget.dart' show HistoricoPedidosWidget;
import 'package:flutter/material.dart';

class HistoricoPedidosModel extends FlutterFlowModel<HistoricoPedidosWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for CardPersonalizado4 component.
  late CardPersonalizado4Model cardPersonalizado4Model1;
  // Model for CardPersonalizado4 component.
  late CardPersonalizado4Model cardPersonalizado4Model2;
  // Model for CardPersonalizado4 component.
  late CardPersonalizado4Model cardPersonalizado4Model3;
  // Model for CardPersonalizado4 component.
  late CardPersonalizado4Model cardPersonalizado4Model4;
  // Model for CardPersonalizado4 component.
  late CardPersonalizado4Model cardPersonalizado4Model5;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    cardPersonalizado4Model1 =
        createModel(context, () => CardPersonalizado4Model());
    cardPersonalizado4Model2 =
        createModel(context, () => CardPersonalizado4Model());
    cardPersonalizado4Model3 =
        createModel(context, () => CardPersonalizado4Model());
    cardPersonalizado4Model4 =
        createModel(context, () => CardPersonalizado4Model());
    cardPersonalizado4Model5 =
        createModel(context, () => CardPersonalizado4Model());
  }

  void dispose() {
    unfocusNode.dispose();
    cardPersonalizado4Model1.dispose();
    cardPersonalizado4Model2.dispose();
    cardPersonalizado4Model3.dispose();
    cardPersonalizado4Model4.dispose();
    cardPersonalizado4Model5.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

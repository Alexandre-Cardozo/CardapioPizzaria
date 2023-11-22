import 'package:pizza_hut/widgets/card_personalizado3_model.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'gerenciar_pedidos_widget.dart' show GerenciarPedidosWidget;
import 'package:flutter/material.dart';

class GerenciarPedidosModel extends FlutterFlowModel<GerenciarPedidosWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for CardPersonalizado3 component.
  late CardPersonalizado3Model cardPersonalizado3Model1;
  // Model for CardPersonalizado3 component.
  late CardPersonalizado3Model cardPersonalizado3Model2;
  // Model for CardPersonalizado3 component.
  late CardPersonalizado3Model cardPersonalizado3Model3;
  // Model for CardPersonalizado3 component.
  late CardPersonalizado3Model cardPersonalizado3Model4;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    cardPersonalizado3Model1 =
        createModel(context, () => CardPersonalizado3Model());
    cardPersonalizado3Model2 =
        createModel(context, () => CardPersonalizado3Model());
    cardPersonalizado3Model3 =
        createModel(context, () => CardPersonalizado3Model());
    cardPersonalizado3Model4 =
        createModel(context, () => CardPersonalizado3Model());
  }

  void dispose() {
    unfocusNode.dispose();
    cardPersonalizado3Model1.dispose();
    cardPersonalizado3Model2.dispose();
    cardPersonalizado3Model3.dispose();
    cardPersonalizado3Model4.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

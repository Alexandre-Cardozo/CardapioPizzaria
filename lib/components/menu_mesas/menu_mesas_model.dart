import 'package:pizza_hut/widgets/card_personalizado6_model.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'menu_mesas_widget.dart' show MenuMesasWidget;
import 'package:flutter/material.dart';

class MenuMesasModel extends FlutterFlowModel<MenuMesasWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for CardPersonalizado6 component.
  late CardPersonalizado6Model cardPersonalizado6Model1;
  // Model for CardPersonalizado6 component.
  late CardPersonalizado6Model cardPersonalizado6Model2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    cardPersonalizado6Model1 =
        createModel(context, () => CardPersonalizado6Model());
    cardPersonalizado6Model2 =
        createModel(context, () => CardPersonalizado6Model());
  }

  void dispose() {
    unfocusNode.dispose();
    cardPersonalizado6Model1.dispose();
    cardPersonalizado6Model2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

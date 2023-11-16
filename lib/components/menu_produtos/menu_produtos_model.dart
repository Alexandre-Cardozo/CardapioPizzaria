import 'package:pizza_hut/widgets/card_personalizado5_model.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'menu_produtos_widget.dart' show MenuProdutosWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuProdutosModel extends FlutterFlowModel<MenuProdutosWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for CardPersonalizado5 component.
  late CardPersonalizado5Model cardPersonalizado5Model1;
  // Model for CardPersonalizado5 component.
  late CardPersonalizado5Model cardPersonalizado5Model2;
  // Model for CardPersonalizado5 component.
  late CardPersonalizado5Model cardPersonalizado5Model3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    cardPersonalizado5Model1 =
        createModel(context, () => CardPersonalizado5Model());
    cardPersonalizado5Model2 =
        createModel(context, () => CardPersonalizado5Model());
    cardPersonalizado5Model3 =
        createModel(context, () => CardPersonalizado5Model());
  }

  void dispose() {
    unfocusNode.dispose();
    cardPersonalizado5Model1.dispose();
    cardPersonalizado5Model2.dispose();
    cardPersonalizado5Model3.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

import 'package:pizza_hut/widgets/card_personalizado2_model.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'carrinho_com_conteudo_widget.dart' show CarrinhoComConteudoWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CarrinhoComConteudoModel
    extends FlutterFlowModel<CarrinhoComConteudoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for CardPersonalizado2 component.
  late CardPersonalizado2Model cardPersonalizado2Model1;
  // Model for CardPersonalizado2 component.
  late CardPersonalizado2Model cardPersonalizado2Model2;
  // Model for CardPersonalizado2 component.
  late CardPersonalizado2Model cardPersonalizado2Model3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    cardPersonalizado2Model1 =
        createModel(context, () => CardPersonalizado2Model());
    cardPersonalizado2Model2 =
        createModel(context, () => CardPersonalizado2Model());
    cardPersonalizado2Model3 =
        createModel(context, () => CardPersonalizado2Model());
  }

  void dispose() {
    unfocusNode.dispose();
    cardPersonalizado2Model1.dispose();
    cardPersonalizado2Model2.dispose();
    cardPersonalizado2Model3.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

import '../../bar/defaultappbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pagamento_por_pix_model.dart';
export 'pagamento_por_pix_model.dart';

class PagamentoPorPixWidget extends StatefulWidget {
  const PagamentoPorPixWidget({Key? key}) : super(key: key);

  @override
  _PagamentoPorPixWidgetState createState() => _PagamentoPorPixWidgetState();
}

class _PagamentoPorPixWidgetState extends State<PagamentoPorPixWidget> {
  late PagamentoPorPixModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PagamentoPorPixModel());
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: DefaultAppBar(
            firstIcon: Icons.arrow_back_rounded,
            title: "Pagamento",
            firstOnPressed: () {
              context.pushNamed('Pedido');
            }),
      ),
    );
  }
}

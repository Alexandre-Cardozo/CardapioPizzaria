import 'package:pizza_hut/appbar/defaultappbar.dart';
import 'package:pizza_hut/card/cardadd.dart';
import 'package:pizza_hut/card/carditem.dart';
import 'package:pizza_hut/widgets/card_personalizado_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        appBar: DefaultAppBar(
            firstIcon: Icons.admin_panel_settings_outlined,
            secondIcon: Icons.shopping_cart,
            title: "Mesa 000",
            firstOnPressed: () async {
              context.pushNamed('LoginAdministrador');
            },
            secondOnPressed: () {
              context.pushNamed('CarrinhoComConteudo');
            }),
        body: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: [
            Image.asset(
              'assets/images/pizza_hut.jpg',
              width: 300.0,
              height: 350.0,
              fit: BoxFit.cover,
            ),
            const CardItemAdd(),
            const CardItemAdd(),
            const CardItemAdd(),
            const CardItemAdd()
          ],
        ),
      ),
    );
  }
}

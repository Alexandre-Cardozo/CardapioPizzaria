import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../bar/defaultappbar.dart';
import '../../card/cardadd.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(
          firstIcon: Icons.admin_panel_settings_outlined,
          secondIcon: Icons.shopping_cart,
          title: "Mesa 000",
          firstOnPressed: () async {
            context.pushNamed('LoginAdministrador');
          },
          secondOnPressed: () {
            context.pushNamed('CarrinhoVazio');
          }),
      body: ListView(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        children: [
          Image.asset(
            'assets/images/pizza_hut.jpg',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            fit: BoxFit.contain,
          ),
          const CardItemAdd(),
          const CardItemAdd(),
          const CardItemAdd(),
          const CardItemAdd(),
          const CardItemAdd(),
          const CardItemAdd(),
          const CardItemAdd(),
          const CardItemAdd(),
          const CardItemAdd(),
          const CardItemAdd(),
          const CardItemAdd(),
          const CardItemAdd()
        ],
      ),
    );
  }
}

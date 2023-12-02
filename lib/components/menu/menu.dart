import 'package:flutter/material.dart';
import 'package:pizza_hut/components/carrinho/carrinho_com_conteudo.dart';
import 'package:pizza_hut/components/login_administrador/login_administrador.dart';

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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginAdministrador(),
              ),
            );
          },
          secondOnPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CarrinhoComConteudo(),
              ),
            );
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

import 'package:flutter/material.dart';
import 'package:pizza_hut/components/carrinho/carrinho_com_conteudo.dart';
import 'package:pizza_hut/components/login_administrador/login_administrador.dart';
import 'package:pizza_hut/controllers/product_controller.dart';
import 'package:pizza_hut/models/product_model.dart';

import '../../bar/defaultappbar.dart';
import '../../card/cardadd.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final ProductControler _productControler = ProductControler();

  Future<void> _loadProducts() async {
    await _productControler.getAllProducts();
  }

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

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
      body: Column(
        children: [
          Image.asset(
            'assets/images/pizza_hut.jpg',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            fit: BoxFit.contain,
          ),
          Expanded(
            child: StreamBuilder<List<Product>>(
              stream: _productControler.productStream,
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    if (snapshot.hasData) {
                      final product = snapshot.data![index];
                      return CardItemAdd(product: product);
                    } else {
                      return null;
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pizza_hut/card/cardmenuproduto.dart';
import 'package:pizza_hut/components/menu_gerenciamento/menu_gerenciamento.dart';
import 'package:pizza_hut/controllers/product_controller.dart';
import 'package:pizza_hut/models/product_model.dart';

import '../../bar/defaultappbar.dart';
import '../../button/largetextbutton.dart';
import '../registrar_produto/registrar_produto.dart';

class MenuProdutos extends StatefulWidget {
  const MenuProdutos({super.key});

  @override
  State<MenuProdutos> createState() => _MenuProdutosState();
}

class _MenuProdutosState extends State<MenuProdutos> {
  final ProductControler _productController = ProductControler();

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _loadProducts() async {
    await _productController.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(
          firstIcon: Icons.arrow_back_rounded,
          title: "Menu Produtos",
          firstOnPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MenuGerenciamento(),
              ),
            );
          }),
      body: StreamBuilder<List<Product>>(
          stream: _productController.productStream,
          builder: (context, snapshot) {
            return SafeArea(
              top: true,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: LargeTextButton(
                      text: "Criar Produto",
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegistrarProduto(),
                          ),
                        );
                        _loadProducts();
                      },
                    ),
                  ),
                  if (snapshot.data != null)
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.length,
                        itemBuilder: ((context, index) {
                          final product = snapshot.data![index];
                          return Column(
                            children: [
                              CardMenuProduto(
                                id: product.productId!,
                                name: product.name!,
                                unitaryValue: product.unitaryValue, 
                                description: product.description!, 
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                ],
              ),
            );
          }),
    );
  }
}

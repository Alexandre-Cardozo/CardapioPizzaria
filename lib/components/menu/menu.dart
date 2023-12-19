import 'package:flutter/material.dart';
import 'package:pizza_hut/card/carditem.dart';
import 'package:pizza_hut/components/carrinho/carrinho_com_conteudo.dart';
import 'package:pizza_hut/components/login_administrador/login_administrador.dart';
import 'package:pizza_hut/components/menu/table_code_provide.dart';
import 'package:pizza_hut/controllers/product_controller.dart';
import 'package:pizza_hut/models/order.dart';
import 'package:pizza_hut/models/product_model.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

import '../../bar/defaultappbar.dart';

class Menu extends StatefulWidget {

  final Order? order;

  const Menu({super.key, this.order});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final ProductControler _productControler = ProductControler();
  Order newOrder = Order.empty();

  Future<void> _loadProducts() async {
    await _productControler.getAllProducts();
  }

  @override
  void initState() {
    super.initState();
    if(widget.order != null){
      newOrder = widget.order!;
    }
    _loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    String? tableCode = Provider.of<TableCodeProvider>(context).tableCode;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(
          firstIcon: Icons.admin_panel_settings_outlined,
          secondIcon: Icons.shopping_cart,
          title: "Mesa $tableCode",
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
                builder: (context) => CarrinhoComConteudo(order: newOrder),
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
                      return itemList(product);
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

  Widget itemList(Product product) {
    ToastContext().init(context);
    return CardItem(
      icon: Icons.add,
      onPressed: () {
        newOrder.products.add(product);
      },
      product: product,
    );
  }
}

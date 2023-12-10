import 'package:flutter/material.dart';
import 'package:pizza_hut/bar/pointedbar.dart';
import 'package:pizza_hut/card/carditem.dart';
import 'package:pizza_hut/models/order.dart';
import 'package:pizza_hut/models/product_model.dart';
import 'package:toast/toast.dart';

import '../../bar/defaultappbar.dart';
import '../../button/largetextbutton.dart';
import '../../card/cardremove.dart';
import '../menu/menu.dart';
import '../pedido/pedido.dart';

class CarrinhoComConteudo extends StatefulWidget {
  final Order? order;

  const CarrinhoComConteudo({super.key, this.order});

  @override
  State<CarrinhoComConteudo> createState() => _CarrinhoComConteudoState();
}

class _CarrinhoComConteudoState extends State<CarrinhoComConteudo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(
          firstIcon: Icons.arrow_back_rounded,
          title: "Carrinho",
          firstOnPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Menu(order: widget.order),
              ),
            );
          }),
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            PointedBar(text: "Produtos"),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: widget.order!.products.length,
                itemBuilder: (context, index) {
                  if (widget.order!.products.isNotEmpty) {
                    return Column(
                      children: [
                        // CardItemRemove(product: widget.order!.products[index], products: widget.order!.products),
                        itemList(widget.order!.products[index])
                      ],
                    );
                  }
                },
              ),
            ),
            LargeTextButton(
              text: "Escolher forma de Pagamento",
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Pedido(order: widget.order),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget itemList(Product product) {
    ToastContext().init(context);
    return CardItem(
      icon: Icons.remove,
      onPressed: () {
        widget.order!.products.remove(product);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CarrinhoComConteudo(order: widget.order),
          ),
        );
      },
      product: product
    );
  }

}

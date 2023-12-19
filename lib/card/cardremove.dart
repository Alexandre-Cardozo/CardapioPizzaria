import 'package:pizza_hut/card/carditem.dart';
import 'package:flutter/material.dart';
import 'package:pizza_hut/components/menu/menu.dart';
import 'package:pizza_hut/models/product_model.dart';
import 'package:toast/toast.dart';

class CardItemRemove extends StatefulWidget {
  final Product product;
  final List<Product>? products;

  const CardItemRemove({super.key, required this.product, this.products});

  @override
  State<CardItemRemove> createState() => _CardItemRemoveState();
}

class _CardItemRemoveState extends State<CardItemRemove> {
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return CardItem(
      icon: Icons.remove,
      onPressed: () {
        widget.products!.remove(widget.product);
        // Toast.show("Item removido!",
        //     duration: 2,
        //     gravity: Toast.bottom,
        //     backgroundColor: const Color(0xF7AE1C1E));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Menu(),
          ),
        );
      },
      product: widget.product,
    );
  }
}

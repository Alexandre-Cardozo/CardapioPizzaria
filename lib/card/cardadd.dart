// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import 'package:pizza_hut/card/carditem.dart';
import 'package:pizza_hut/models/product_model.dart';

class CardItemAdd extends StatefulWidget {
  final Product product;
  final List<Product> products;

  const CardItemAdd({
    super.key,
    required this.product,
    required this.products,
  });

  @override
  State<CardItemAdd> createState() => _CardItemAddState();
}

class _CardItemAddState extends State<CardItemAdd> {
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return CardItem(
        icon: Icons.add,
        onPressed: () {
          widget.products.add(widget.product);
          Toast.show("Item adicionado ao carrinho!",
            duration: 2,
            gravity: Toast.bottom,
            backgroundColor: const Color(0xF7AE1C1E));
        },
        product: widget.product,
        );
  }
}

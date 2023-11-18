import 'package:pizza_hut/card/carditem.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class CardItemAdd extends StatefulWidget {
  const CardItemAdd({super.key});

  @override
  State<CardItemAdd> createState() => _CardItemAddState();
}

class _CardItemAddState extends State<CardItemAdd> {
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return CardItem(
        icon: Icons.add,
        onPressed: () => Toast.show(
            "Item adicionado ao carrinho!",
            duration: 2,
            gravity: Toast.bottom,
            backgroundColor: const Color(0xF7AE1C1E)));
  }
}

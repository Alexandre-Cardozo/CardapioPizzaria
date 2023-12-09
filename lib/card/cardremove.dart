import 'package:pizza_hut/card/carditem.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class CardItemRemove extends StatefulWidget {
  const CardItemRemove({super.key});

  @override
  State<CardItemRemove> createState() => _CardItemRemoveState();
}

class _CardItemRemoveState extends State<CardItemRemove> {
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    // return CardItem(
    //     icon: Icons.remove,
    //     onPressed: () => Toast.show("Item removido!",
    //         duration: 2,
    //         gravity: Toast.bottom,
    //         backgroundColor: const Color(0xF7AE1C1E))
    //     );
    return Container();
  }
}

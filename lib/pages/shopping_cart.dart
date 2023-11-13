import 'package:flutter/material.dart';
import 'package:pizza_hut/pages/menu_cliente.dart';
import 'package:pizza_hut/widgets/button_back.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 6,
          alignment: Alignment.center,
          color: Colors.red,
          child: ButtonBack(
              iconData: Icons.arrow_circle_left,
              alignment: Alignment.centerLeft,
              click: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const Menu_Cliente())
                );
              }
          )
        )
      ],
    );
  }

}

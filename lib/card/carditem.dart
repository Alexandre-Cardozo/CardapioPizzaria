import 'package:flutter/material.dart';
import 'package:pizza_hut/models/product_model.dart';

import '../button/iconedbutton.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key, 
    required this.icon, 
    this.onPressed, 
    required this.product,
    });

  final IconData icon;
  final Function()? onPressed;
  final Product product;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
      child: Card(
        color: Colors.white,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(product.name!,
                      style: const TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Color(0xFFC2C2C2),
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                    product.description!,
                    style: const TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Color(0xFFC2C2C2),
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text('R\$ ${product.unitaryValue}',
                        style: const TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Color(0xB339D254),
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: IconedButton(
                      icon: icon,
                      size: 45,
                      color: const Color(0xF7AE1C1E),
                      onPressed: onPressed,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

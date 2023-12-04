import 'package:flutter/material.dart';
import 'package:pizza_hut/components/registrar_produto/registrar_produto.dart';
import 'package:pizza_hut/controllers/product_controller.dart';

import '../button/smalltextbutton.dart';

// ignore: must_be_immutable
class CardMenuProduto extends StatelessWidget {

  String id;
  String name;
  double unitaryValue;
  String description;

  CardMenuProduto({
    super.key,
    required this.id,
    required this.name,
    required this.unitaryValue,
    required this.description,
    });

  @override
  Widget build(BuildContext context) {
    ProductControler productControler = ProductControler();

    return Padding(
      padding: const EdgeInsets.only(left: 2, right: 10, bottom: 5),
      child: Card(
        color: Colors.black,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 0, right: 0),
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(name,
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
                    description,
                    style: const TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Color(0xFFC2C2C2),
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text('R\$ ${unitaryValue.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontFamily: 'Readex Pro',
                              color: Color(0xB339D254),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SmallTextButton(
                    text: "Editar",
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegistrarProduto(),
                        ),
                      );
                    },
                  ),
                  SmallTextButton(
                    text: "Excluir",
                    onPressed: () {
                      productControler.deleteProduct(id);
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

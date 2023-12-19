import 'package:flutter/material.dart';
import 'package:pizza_hut/components/menu_produtos/menu_produtos.dart';
import 'package:pizza_hut/components/registrar_produto/registrar_produto.dart';
import 'package:pizza_hut/controllers/product_controller.dart';
import 'package:pizza_hut/models/product_model.dart';

import '../button/smalltextbutton.dart';

// ignore: must_be_immutable
class CardMenuProduto extends StatefulWidget {

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
  State<CardMenuProduto> createState() => _CardMenuProdutoState();
}

class _CardMenuProdutoState extends State<CardMenuProduto> {
  final Product product = Product();

  @override
  void initState() {
    super.initState();
    fillProduct();
  }

  fillProduct() {
    product.productId = widget.id;
    product.name = widget.name;
    product.unitaryValue = widget.unitaryValue;
    product.description = widget.description;
  }

  @override
  Widget build(BuildContext context) {
    ProductControler productControler = ProductControler();

    return Padding(
      padding: const EdgeInsets.only(left: 2, right: 10, bottom: 5),
      child: Card(
        color: Colors.white,
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
                  child: Text(widget.name,
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
                    widget.description,
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
                      child: Text('R\$ ${widget.unitaryValue.toStringAsFixed(2)}',
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
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegistrarProduto(product: product),
                        ),
                      );
                    },
                  ),
                  SmallTextButton(
                    text: "Excluir",
                    onPressed: () async {
                      await productControler.deleteProduct(widget.id);  
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MenuProdutos(),
                        ),
                      );
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

import 'package:flutter/material.dart';
import 'package:pizza_hut/components/registrar_produto/registrar_produto.dart';

import '../button/smalltextbutton.dart';

class CardMenuProduto extends StatelessWidget {
  const CardMenuProduto({super.key});

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
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            children: [
              const Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text('Nome',
                      style: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Color(0xFFC2C2C2),
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              const Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                    'Descricao, Descricao, Descricao, Descricao, Descricao, Descricao, Descricao, Descricao, Descricao, Descricao, Descricao, Descricao',
                    style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Color(0xFFC2C2C2),
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold)),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text('R\$ Preço',
                          style: TextStyle(
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
                    onPressed: () async {},
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

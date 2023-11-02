// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class Menu_Cliente extends StatefulWidget {
  const Menu_Cliente({super.key});

  @override
  State<Menu_Cliente> createState() => _Menu_ClienteState();
}

class _Menu_ClienteState extends State<Menu_Cliente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height / 4,
              alignment: Alignment.center,
              color: Colors.cyan,
              child: const Text("Imagem")),
          Container(
              height: MediaQuery.of(context).size.height / 8,
              alignment: Alignment.center,
              color: Colors.lightGreen,
              child: const Text("Menu")),
          Container(
              height: MediaQuery.of(context).size.height / 1.6,
              alignment: Alignment.center,
              color: Colors.red,
              child: const Text("Listagem"))
        ],
      ),
    );
  }
}

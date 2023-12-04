import 'package:flutter/material.dart';
import 'package:pizza_hut/components/menu_produtos/menu_produtos.dart';
import 'package:pizza_hut/controllers/add_product_controller.dart';
import 'package:pizza_hut/flutter_flow/flutter_flow_model.dart';
import 'package:pizza_hut/models/product_model.dart';

import '../../bar/defaultappbar.dart';
import '../../button/largetextbutton.dart';

class RegistrarProduto extends StatefulWidget {
  const RegistrarProduto({super.key});

  @override
  State<RegistrarProduto> createState() => _RegistrarProdutoState();
}

final addProductController = AddProductController();

class _RegistrarProdutoState extends State<RegistrarProduto> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;

  late Product product;

  String? Function(BuildContext, String?)? textController1Validator;
  String? Function(BuildContext, String?)? textController2Validator;
  String? Function(BuildContext, String?)? textController3Validator;

  @override
  void initState() {
    textController1 ??= TextEditingController();
    textController2 ??= TextEditingController();
    textController3 ??= TextEditingController();
    product = Product();
    addProductController.resert();
    addProductController.initialize();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(
          firstIcon: Icons.arrow_back_rounded,
          title: "Produto",
          firstOnPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MenuProdutos(),
              ),
            );
          }),
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text('Nome',
                                  style: TextStyle(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF57636C),
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: TextFormField(
                              controller: textController1,
                              keyboardType: TextInputType.text,
                              onChanged: (newValue) => {
                                  
                                product.name = newValue,
                                addProductController.setName(newValue),
                                addProductController.setData(product),

                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, insira um nome';
                                }
                                return null;
                              
                              },
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                labelStyle: const TextStyle(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFF57636C),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                ),
                                hintText: 'Insira o nome do produto',
                                hintStyle: const TextStyle(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFF57636C),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              style: const TextStyle(
                                fontFamily: 'Readex Pro',
                                color: Color(0xFF14181B),
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'Valor Unitário',
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF57636C),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: TextFormField(
                              controller: textController2,
                              onChanged: (newValue) => {
                                product.unitaryValue = double.parse(newValue),
                                addProductController.setData(product),
                              },
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                labelStyle: const TextStyle(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFF57636C),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                ),
                                hintText: 'Insira o valor unitário do produto',
                                hintStyle: const TextStyle(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFF57636C),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              style: const TextStyle(
                                fontFamily: 'Readex Pro',
                                color: Color(0xFF14181B),
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                              ),
                              keyboardType: TextInputType.number,
                              // Definir como numérico
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, insira um valor';
                                }
                                try {
                                  double.parse(value);
                                } catch (e) {
                                  return 'Por favor, insira um valor válido';
                                }
                                return null; // Retorna nulo se for válido
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'Descrição',
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF57636C),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: TextFormField(
                              controller: textController3,
                              onChanged: (newValue) => {
                                  product.description = newValue,
                                  addProductController.setData(product),
                              },
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                labelStyle: const TextStyle(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFF57636C),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                ),
                                hintText: 'Insira a descrição do produto',
                                hintStyle: const TextStyle(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFF57636C),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              style: const TextStyle(
                                fontFamily: 'Readex Pro',
                                color: Color(0xFF14181B),
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                              ),
                              keyboardType: TextInputType.text,
                              validator:
                                  textController3Validator.asValidator(context),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            LargeTextButton(
              text: "Salvar Alterações",
              onPressed: () async {
                addProductController.onButtonClick(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MenuProdutos(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

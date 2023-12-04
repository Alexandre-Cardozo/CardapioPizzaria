import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pizza_hut/components/menu_gerenciamento/menu_gerenciamento.dart';
import 'package:pizza_hut/flutter_flow/flutter_flow_model.dart';

import '../../bar/defaultappbar.dart';
import '../../button/largetextbutton.dart';
import 'package:toast/toast.dart';

import '../menu/menu.dart';

class LoginAdministrador extends StatefulWidget {
  const LoginAdministrador({super.key});

  @override
  State<LoginAdministrador> createState() => _LoginAdministradorState();
}

class _LoginAdministradorState extends State<LoginAdministrador> {
  final unfocusNode = FocusNode();
  FocusNode? textFieldFocusNode1;
  FocusNode? textFieldFocusNode2;

  TextEditingController? textController1;
  TextEditingController? textController2;

  String? Function(BuildContext, String?)? textController1Validator;
  String? Function(BuildContext, String?)? textController2Validator;

  late bool passwordVisibility = false;
  late FirebaseAuth auth;

  @override
  void initState() {
    super.initState();
    textController1 ??= TextEditingController();
    textFieldFocusNode1 ??= FocusNode();
    textController2 ??= TextEditingController();
    textFieldFocusNode2 ??= FocusNode();
    auth = FirebaseAuth.instance;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(
          firstIcon: Icons.arrow_back_rounded,
          title: "Login",
          firstOnPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Menu(),
              ),
            );
          }),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/pizza_hut.jpg',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3,
                      fit: BoxFit.contain,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'Email',
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
                              textInputAction: TextInputAction.next,
                              controller: textController1,
                              focusNode: textFieldFocusNode1,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: const TextStyle(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFF57636C),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                ),
                                hintText: 'Insira seu email',
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
                              keyboardType: TextInputType.emailAddress,
                              validator:
                                  textController1Validator.asValidator(context),
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
                                'Senha',
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
                              textInputAction: TextInputAction.next,
                              controller: textController2,
                              focusNode: textFieldFocusNode2,
                              obscureText: !passwordVisibility,
                              decoration: InputDecoration(
                                labelStyle: const TextStyle(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFF57636C),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                ),
                                hintText: 'Insira sua senha',
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
                                suffixIcon: InkWell(
                                  onTap: () => setState(
                                    () => passwordVisibility =
                                        !passwordVisibility,
                                  ),
                                  focusNode: FocusNode(skipTraversal: true),
                                  child: Icon(
                                    color: Colors.black,
                                    passwordVisibility
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    size: 25.0,
                                  ),
                                ),
                              ),
                              style: const TextStyle(
                                fontFamily: 'Readex Pro',
                                color: Color(0xFF14181B),
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator:
                                  textController2Validator.asValidator(context),
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
              text: "Entrar",
              onPressed: () async {
                login(context);

                auth.userChanges().listen((User? user) {
                  if (user != null) {
                    Toast.show("Logado com Sucesso!",
                        duration: 2,
                        gravity: Toast.bottom,
                        backgroundColor: const Color(0xF7AE1C1E));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MenuGerenciamento(),
                      ),
                    );
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }

  void login(BuildContext context) async {
    try {
      if (textController1 != null && textController2 != null) {
        UserCredential result = await auth.signInWithEmailAndPassword(
          email: textController1!.text,
          password: textController2!.text,
        );
      } else {
        Toast.show("Erro: controladores não inicializados",
            duration: 2,
            gravity: Toast.bottom,
            backgroundColor: const Color(0xF7AE1C1E));
      }
    } on FirebaseAuthException catch (error) {
      Toast.show(error.toString(),
          duration: 2,
          gravity: Toast.bottom,
          backgroundColor: const Color(0xF7AE1C1E));
    }
  }
}

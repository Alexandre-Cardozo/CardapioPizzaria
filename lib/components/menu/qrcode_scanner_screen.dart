import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:pizza_hut/backend/firebase/firebase_config.dart';
import 'package:pizza_hut/components/menu/menu.dart';
import 'package:pizza_hut/components/menu/table_code_provide.dart';
import 'package:pizza_hut/controllers/table_controller.dart';
import 'package:pizza_hut/flutter_flow/flutter_flow_theme.dart';
import 'package:provider/provider.dart';

void initilize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();
  await FlutterFlowTheme.initialize();
  await Firebase.initializeApp();
}

class QRCodePage extends StatefulWidget {
  const QRCodePage({super.key});

  @override
  State<QRCodePage> createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  String ticket = '';
  List<String> tickets = [];
  TableController tableController = TableController();

  readQRCode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
      "#FFFFFF",
      "Cancelar",
      false,
      ScanMode.QR,
    );
    setState(() {
      if (code != '-1') {
        Provider.of<TableCodeProvider>(context, listen: false).tableCode = code;

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Menu(),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (ticket != '')
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Text(
                  'Ticket: $ticket',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton.icon(
                onPressed: readQRCode,
                icon: const Icon(Icons.qr_code),
                label: const Text('Ler QRCode'),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton.icon(
                onPressed: () => {
                  Provider.of<TableCodeProvider>(context, listen: false)
                      .tableCode = "001",
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Menu(),
                      ))
                },
                icon: const Icon(Icons.menu),
                label: const Text('Pular para o Menu'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

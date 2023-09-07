import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_code_presentation/pages/qr_code.dart';

class LeitorQR extends StatefulWidget {
  const LeitorQR({super.key});

  @override
  LeitorQRState createState() {
    return LeitorQRState();
  }
}

class LeitorQRState extends State<LeitorQR> {
  String result = "";
  escaneiaQRCode() async {
    try{
      String code = await FlutterBarcodeScanner.scanBarcode(
          "#FFFF0000", "Cancelar", false, ScanMode.QR);
      setState(() => result = code != "-1"? code : "Não foi possível escanear o código QR.");
    }catch(e){
      setState(() =>result = "Não foi possível escanear o código QR.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Trabalho PDM QR code")),
      drawer: Drawer(
          child: ListView(
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Módulos apresentados",
                style: TextStyle(color: Colors.white),
              )),
          ListTile(
            title: const Text("Gerar QR Code"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const QRcodePage()));
            },
          )
        ],
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
                onPressed: escaneiaQRCode,
                icon: const Icon(Icons.qr_code),
                label: const Text("Escanear")),
            Text(result)
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:qr_code_presentation/pages/leitor.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRcodePage extends StatefulWidget {
  const QRcodePage({super.key});

  @override
  QRcodePagState createState() {
    return QRcodePagState();
  }
}

class QRcodePagState extends State<QRcodePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
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
              title: const Text("Leitor QR"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LeitorQR()));
              },
            )
          ],
        )),
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Gere seu QR code aqui",
                  ),
                  controller: controller,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: const Text("Criar Código QR!")),
            controller.text.isNotEmpty
                ? QrImageView(
                    data: controller.text,
                    version: QrVersions.auto,
                    size: 200.0,
                    gapless: true,
                    errorCorrectionLevel: QrErrorCorrectLevel.Q,
                  )
                : const Text("Insira o QR code")
          ],
        )));
  }
}

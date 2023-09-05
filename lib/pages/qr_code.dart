import 'package:flutter/material.dart';
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
        appBar: AppBar(
          title: const Text("Gerador Código QR"),
        ),
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
            controller.text.isNotEmpty? QrImageView(
              data: controller.text,
              version: QrVersions.auto,
              size: 200.0,
              gapless: true,
              errorCorrectionLevel: QrErrorCorrectLevel.Q,
            ): const Text("Insira o QR code")
          ],
        )));
  }
}

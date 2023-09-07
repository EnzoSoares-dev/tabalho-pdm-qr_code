import "package:flutter/material.dart";

import "QR_code.dart";
import "leitor.dart";

class HistoricoPage extends StatefulWidget {
  const HistoricoPage({super.key});

  @override
  HistoricoPageState createState() {
    return HistoricoPageState();
  }
}

class HistoricoPageState extends State<HistoricoPage> {
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
            ),
            ListTile(
              title: const Text("Gerador QR"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const QRcodePage()));
              },
            )
          ],
        )),
    );
  }
}

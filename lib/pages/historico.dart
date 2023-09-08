import "package:flutter/material.dart";
import "package:qr_code_presentation/database/connection.dart";
import "package:qr_code_presentation/database/models/registro.dart";
import "package:qr_code_presentation/widgets/button_text.dart";

import "QR_code.dart";
import "leitor.dart";

class HistoricoGeradoPage extends StatefulWidget {
  const HistoricoGeradoPage({super.key});

  @override
  HistoricoGeradoPageState createState() {
    return HistoricoGeradoPageState();
  }
}

class HistoricoGeradoPageState extends State<HistoricoGeradoPage> {
  final Connection connection = Connection();
  @override
  Widget build(BuildContext context) {
    var registros = _buscaHistoricoGerado();
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
          ),
          ListTile(
            title: const Text("Hitórico Qrs Lidos"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HistoricoLidoPage()));
            },
          )
        ],
      )),
      body: FutureBuilder(
          future: registros,
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              final List<Widget> historico = List.empty(growable: true);
              dynamic row = snapshot.data;
              for (final data in row) {
                historico.add(ButtonText(data.registro));
              }
              return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: historico),
              );
            }
            return const Column(
              children: [Text("Não possui nenhum código escaneado")],
            );
          }),
    );
  }

  _buscaHistoricoGerado() async {
    List<Registro> registros = await connection.getRegistrosGerados();
    return registros;
  }
}

class HistoricoLidoPage extends StatefulWidget {
  @override
  HistoricoLidoPageState createState() {
    return HistoricoLidoPageState();
  }
}

class HistoricoLidoPageState extends State<HistoricoLidoPage> {
 final Connection connection = Connection();
  @override
  Widget build(BuildContext context) {
    var registros = _buscaHistoricoLido();
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
          ),
          ListTile(
            title: const Text("Hitorico QRs gerados"),
            onTap:(){
               Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HistoricoGeradoPage()));
            },
          )
        ],
      )),
      body: FutureBuilder(
          future: registros,
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              final List<Widget> historico = List.empty(growable: true);
              dynamic row = snapshot.data;
              for (final data in row) {
                historico.add(ButtonText(data.registro));
              }
              return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: historico),
              );
            }
            return const Column(
              children: [Text("Não possui nenhum código escaneado")],
            );
          }),
    );
  }

  _buscaHistoricoLido() async {
    List<Registro> registros = await connection.getRegistrosLidos();
    return registros;
  }
}

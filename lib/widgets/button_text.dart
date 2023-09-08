import "package:flutter/material.dart";
import "package:qr_flutter/qr_flutter.dart";

class ButtonText extends StatefulWidget {
  ButtonText(this.registro, {super.key});
  String registro = "";

  @override
  ButtonTextState createState() {
    return ButtonTextState();
  }
}

class ButtonTextState extends State<ButtonText> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: _apresentaModalQrRegistro, child: Text(widget.registro));
  }

  _apresentaModalQrRegistro() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text(widget.registro),
            children: [
              Column(
                children: [
                  QrImageView(
                    data: widget.registro,
                    size: 100,
                  ),
                  Row(
                    children: [
                      SimpleDialogOption(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Fechar"),
                      )
                    ],
                  )
                ],
              )
            ],
          );
        });
  }
}

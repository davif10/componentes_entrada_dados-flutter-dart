import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de dados"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(32),
            child: TextField(
              //text, number,emailAddress,datetime
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite um valor"
              ),
              //enabled: true,
              //maxLength: 2,
              //maxLengthEnforced: false,
              style: TextStyle(
                fontSize: 25,
                color: Colors.blueAccent
              ),
              //obscureText: true,
              /*
              onChanged: (String text){
                print("Valor digitado: $text");
              },*/
              onSubmitted: (String text){
                print("Valor digitado: $text");
              },
              controller: _textEditingController,
            ),
          ),
          TextButton(
            child: Text(
                "Salvar",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.lightBlue,
              ),

              onPressed: (){
                print("Valor digitado: ${_textEditingController.text}");
              }),
        ],
      ),
    );
  }
}

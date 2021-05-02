import 'package:flutter/material.dart';

class EntradaCheckbox extends StatefulWidget {
  @override
  _EntradaCheckboxState createState() => _EntradaCheckboxState();
}

class _EntradaCheckboxState extends State<EntradaCheckbox> {
  bool _comidaBrasileira = false;
  bool _comidaMexicana = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de dados"),
      ),
      body: Container(
        child: Column(
          children: [
            CheckboxListTile(
                title: Text("Comida Brasileira"),
                subtitle: Text("A melhor comida do mundo."),
                activeColor: Colors.red,
                selected: _comidaBrasileira,
                value: _comidaBrasileira,
                secondary: Icon(Icons.add_box),
                onChanged: (bool valor) {
                  setState(() {
                    _comidaBrasileira = valor;
                  });
                }),
            CheckboxListTile(
                title: Text("Comida Mexicana"),
                subtitle: Text("A melhor comida do mundo."),
                //activeColor: Colors.red,
                //selected: _comidaMexicana,
                value: _comidaMexicana,
                secondary: Icon(Icons.add_box),
                onChanged: (bool valor) {
                  setState(() {
                    _comidaMexicana = valor;
                  });
                }),
            RaisedButton(
              child: Text("Salvar", style: TextStyle(fontSize: 20)),
              onPressed: (){
                print("Comida brasileira: ${_comidaBrasileira.toString()} \n"
                    "Comida Mexicana: ${_comidaMexicana.toString()}");
              },
            ),

            /*
            Text("Comida Brasileira"),
            Checkbox(
                value: _estaSelecionado,
                onChanged: (bool valor){
                  setState(() {
                    _estaSelecionado = valor;
                  });
                },
            ),
             */
          ],
        ),
      ),
    );
  }
}

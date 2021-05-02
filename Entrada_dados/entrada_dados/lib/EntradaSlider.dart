import 'package:flutter/material.dart';

class EntradaSlider extends StatefulWidget {
  @override
  _EntradaSliderState createState() => _EntradaSliderState();
}

class _EntradaSliderState extends State<EntradaSlider> {
  double _valor = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de dados"),
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            Slider(
                value: _valor,
                min: 0,
                max: 10,
                label: "$_valor",
                divisions: 10,
                activeColor: Colors.purple,
                inactiveColor: Colors.red,
                onChanged: (double novoValor){
                  setState(() {
                    _valor = novoValor;
                  });
                }
            ),
            RaisedButton(
              child: Text("Salvar", style: TextStyle(fontSize: 20)),
              onPressed: () {
                  print("Valor selecionado: $_valor");
              },
            ),
          ],
        ),
      ),
    );
  }
}

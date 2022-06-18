import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _cnpjController = TextEditingController();
  TextEditingController _cepController = TextEditingController();
  TextEditingController _telController = TextEditingController();
  TextEditingController _dataController = TextEditingController();
  TextEditingController _moedaController = TextEditingController();
  String _valorRecuperado = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mascara e Validações"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //CPF
              TextField(
                controller: _cpfController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Digite o CPF"
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfInputFormatter()
                ],
              ),

              //CNPJ
              TextField(
                controller: _cnpjController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Digite o CNPJ"
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CnpjInputFormatter()
                ],
              ),

              //CEP
              TextField(
                controller: _cepController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Digite o CEP"
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CepInputFormatter()
                ],
              ),

              //Telefone
              TextField(
                controller: _telController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Digite o telefone"
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  TelefoneInputFormatter()
                ],
              ),

              //Data
              TextField(
                controller: _dataController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Digite a data"
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  DataInputFormatter()
                ],
              ),

              //Moeda
              TextField(
                controller: _moedaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Digite a moeda"
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CentavosInputFormatter()
                ],
              ),
              TextButton(
                onPressed: (){
                  setState((){
                    //_valorRecuperado = _cpfController.text;
                    // _valorRecuperado = _cnpjController.text;
                    // _valorRecuperado = _cepController.text;
                    // _valorRecuperado = _dataController.text;
                    // _valorRecuperado = _telController.text;
                    // _valorRecuperado = _moedaController.text;
                    String moedaBD = _moedaController.text;
                    moedaBD = moedaBD.replaceAll(".", "");
                    moedaBD = moedaBD.replaceAll(",", ".");

                    double valor = double.parse(moedaBD);
                    // double total = valor + 859.89;
                    var formatador = NumberFormat("#,##0.00", "pt_BR");
                    var resultado = formatador.format(valor);
                    _valorRecuperado = resultado;

                    //for(var item in Estados.listaEstados){
                    for(var item in Meses.listaMeses){
                      print("Item: ${item}");
                    }
                  });
                },
                child: Text("Recuperar valor",),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  primary: Colors.white
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text("Valor: $_valorRecuperado", style: TextStyle(fontSize: 25),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

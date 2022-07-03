import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validadores/Validador.dart';

class Formulario extends StatefulWidget {
  const Formulario({Key? key}) : super(key: key);

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _formKey = GlobalKey<FormState>();
  String _mensagem = "";
  TextEditingController _nomeController = TextEditingController(text: "Davi");
  TextEditingController _idadeController = TextEditingController(text: "32");
  TextEditingController _cpfController = TextEditingController(text: "334.616.710-02");
  String _nome = "";
  String _idade = "";
  String _cpf = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulário"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomeController,
                onSaved: (valor){
                  _nome = valor!;
                },
                decoration: InputDecoration(
                  hintText: "Digite seu nome",
                ),
                validator: (valor){
                  return Validador()
                      .add(Validar.OBRIGATORIO, msg: "Campo obrigatório")
                  .minLength(5, msg: "Mínimo de 5 caracteres")
                  .maxLength(100,  msg: "Máximo de 100 caracteres")
                      .valido(valor);
                },
              ),
              TextFormField(
                controller: _idadeController,
                onSaved: (valor){
                  _idade = valor!;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Digite sua idade",
                ),
                validator: (valor){
                  return Validador()
                      .add(Validar.OBRIGATORIO, msg: "Campo obrigatório")
                      .valido(valor);
                },
              ),
              TextFormField(
                controller: _cpfController,
                onSaved: (valor){
                  _cpf = valor!;
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfInputFormatter()
                ],
                decoration: InputDecoration(
                  hintText: "Digite seu cpf",
                ),
                validator: (valor){
                  // if(valor!.isEmpty){
                  //   return "Campo obrigatório";
                  // }
                  // if(!CPFValidator.isValid(valor)){
                  //   return "CPF inválido";
                  // }
                  return Validador()
                      .add(Validar.OBRIGATORIO, msg: "Campo obrigatório")
                      .add(Validar.CPF, msg: "CPF Inválido")
                  .valido(valor);
                },
              ),
              TextButton(onPressed: (){
                if(_formKey.currentState!.validate()){
                  _formKey.currentState?.save();

                  setState((){
                    // _nome = _nomeController.text;
                    // _idade = _idadeController.text;
                    // _cpf = _cpfController.text;
                    _mensagem = "Nome: $_nome idade: $_idade CPF: $_cpf";
                  });
                }
              }, child: Text("Salvar", style: TextStyle(fontSize: 25),)),
              Text(_mensagem, style: TextStyle(fontSize: 25, color: Colors.red))
            ],
          ),
        ),
      ),
    );
  }
}

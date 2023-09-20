import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: SplitTheBill())); 
}

class SplitTheBill extends StatefulWidget {
  const SplitTheBill({super.key});

  @override
  State<SplitTheBill> createState() => _SplitTheBillState();
}

class _SplitTheBillState extends State<SplitTheBill> {
  TextEditingController numPessoas = TextEditingController();
  TextEditingController totalConta = TextEditingController();
  TextEditingController tip = TextEditingController();
  String resposta="Resposta: ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Split the bill"),
        centerTitle: true,
      ), body: body(),
    );
  }
  Widget body(){ //margem
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.fromLTRB(10, 20, 10,10), 
      child: Column(children: [
        //campo para inserir texto
        TextField( controller: totalConta,
          keyboardType: TextInputType.number, 
          style: TextStyle(fontSize: 22, color: Colors.grey), 
          decoration: InputDecoration(
            labelText: "Total", labelStyle: TextStyle(fontSize: 22)),
        ),
         TextField( controller: numPessoas,
          keyboardType: TextInputType.number, 
          style: TextStyle(fontSize: 22, color: Colors.grey),
          decoration: InputDecoration(
            labelText: "Número de Pessoas", labelStyle : TextStyle(fontSize: 22)),
        ),
        TextField( controller: tip,
          keyboardType: TextInputType.number, 
          style: TextStyle(fontSize: 22, color: Colors.grey),
          decoration: InputDecoration(
            labelText: "Porcentagem gorjeta", labelStyle: TextStyle(fontSize: 22)),
        ),
        Padding(padding: EdgeInsets.only(top:10)),
        ElevatedButton(onPressed: calcular, child: Text("Calcular")),
        Padding(padding: EdgeInsets.only(top:20)),
        Text(resposta)
      ]), 
    );
  }

  calcular(){
    double valorParcial = double.parse(totalConta.text) * (1 + (double.parse(tip.text)) / 100);
    double gorjeta = double.parse(totalConta.text) * (double.parse(tip.text) / 100);
    double valorFinal = valorParcial / (int.parse(numPessoas.text));
    setState(() {
        resposta = "Valor total " + valorParcial.toStringAsPrecision(4) + '\nValor por pessoa: ' +  valorFinal.toStringAsPrecision(4) + '\nGorjeta: ' + gorjeta.toStringAsPrecision(4);
    });
  
  }
}
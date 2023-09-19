import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyImc())); //Define como padrão o Material App
}

//começa digitando sta...
class MyImc extends StatefulWidget {
  const MyImc({super.key});

  @override
  State<MyImc> createState() => _MyImcState();
}

class _MyImcState extends State<MyImc> {
  TextEditingController numPessoas = TextEditingController();
  TextEditingController totalConta = TextEditingController();
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
      margin: EdgeInsets.all(10), //define para todos os lados
      padding: EdgeInsets.fromLTRB(10, 20, 10,10), //determina cada lado
      child: Column(children: [
        //campo para inserir texto
        TextField( controller: totalConta,
          keyboardType: TextInputType.number, //restringe/ajusta o teclado para aparecer apenas as entradas "permitidas"
          style: TextStyle(fontSize: 22, color: Colors.grey), //possibilita vários atributos para estilização
          decoration: InputDecoration(
            labelText: "Total", labelStyle: TextStyle(fontSize: 22)),
        ),
         TextField( controller: numPessoas,
          keyboardType: TextInputType.number, //restringe/ajusta o teclado para aparecer apenas as entradas "permitidas"
          style: TextStyle(fontSize: 22, color: Colors.grey), //possibilita vários atributos para estilização
          decoration: InputDecoration(
            labelText: "Número de Pessoas", labelStyle: TextStyle(fontSize: 22)),
        ),
        Padding(padding: EdgeInsets.only(top:10)),
        ElevatedButton(onPressed: calcular, child: Text("Calcular")),
        Padding(padding: EdgeInsets.only(top:20)),
        Text(resposta)
      ]), 
    );
  }

  calcular(){
    double valorFinal = int.parse(totalConta.text) / (int.parse(numPessoas.text));
    setState(() {
        resposta = "O valor para cada pessoa é de "+ valorFinal.toStringAsPrecision(4);
    });
  
  }
}
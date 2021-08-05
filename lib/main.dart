import 'package:flutter/material.dart';
import 'Adder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Somar'),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Adder ad = Adder(0, 0);
  int soma = 0;

  @override
  Widget build(BuildContext context) {

    void _somar(){
      setState(() {
        soma = ad.soma();
      });
    }

    return Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Primeiro número',
            ),
            onChanged: (value) => {if(value.isNotEmpty) ad.num1 = int.parse(value)},
            keyboardType: TextInputType.number,
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Segundo número',
            ),
            onChanged: (value) => {if(value.isNotEmpty) ad.num2 = int.parse(value)},
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
              onPressed: _somar,
              child: Text('Somar'),
          ),
          Text('Resultado da soma: $soma'),
      ],
    );
  }
}
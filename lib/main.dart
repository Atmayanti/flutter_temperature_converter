import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;
  TextEditingController controllerInput = new TextEditingController();
  String _newValue = "Kelvin";
  double hasil = 0;

  void _konversi() {
    setState(() {
      _inputUser = double.parse(controllerInput.text);
      if (_newValue == "Kelvin")
        hasil = _inputUser + 273;
      else
        hasil = (4 / 5) * _inputUser;
    });
  }

  var listItem = ["Kelvin", "Reamur"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atmayanti Temperature Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Temperature Converter"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              TextFormField(
                controller: controllerInput,
                decoration:
                    InputDecoration(hintText: 'Masukkan Suhu Dalam celcius'),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              DropdownButton<String>(
                items: listItem.map((String value){
                  return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),);
                }).toList(),
                value: _newValue,
                onChanged: (String? changeValue) {
                  setState(() {
                  _newValue = changeValue.toString();
                  });
                  _konversi();
                },
              ),
              result(hasil: hasil),
              Container(
                margin: EdgeInsets.only(top: 170),
                width: 1000,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    _konversi();
                  },
                  child: Text('Konversi'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

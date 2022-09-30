import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  void _konversi() {
    setState(() {
      _inputUser = double.parse(controllerInput.text);
      _kelvin = _inputUser + 273;
      _reamur = _inputUser * 0.8;
    });
  }

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
                    InputDecoration(hintText: 'Masukkan Suhu dalam Celcius'),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              Container(
                margin: EdgeInsets.only(top: 250),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Suhu dalam Reamour",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              _reamur.toString(),
                              style: TextStyle(fontSize: 30),
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Suhu dalam Kelvin",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              _kelvin.toString(),
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.normal),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
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

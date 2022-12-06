import 'package:flutter/material.dart';
import 'package:flutter_suhu_listmap/widgets/convert.dart';
import 'package:flutter_suhu_listmap/widgets/dropdown.dart';
import 'package:flutter_suhu_listmap/widgets/history.dart';
import 'package:flutter_suhu_listmap/widgets/input.dart';
import 'package:flutter_suhu_listmap/widgets/output.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = TextEditingController();

  double _output = 0;
  String selectedDropDown = "Kelvin";
  List<String> listSuhu = [
    "Kelvin",
    "Reamur",
    "Fahrenheit",
  ];
  List<String> listHasil = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Konverter Suhu - Amelia Marshanda/2041720041"),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Input(etInput: etInput),
              const SizedBox(height: 10),
              DropDownList(
                selectedDropDown: selectedDropDown,
                listSuhu: listSuhu,
                onChanged: onDropdownChanged,
              ),
              const SizedBox(height: 10),
              const Text(
                'Hasil',
                style: TextStyle(fontSize: 24),
              ),
              Output(output: _output),
              const SizedBox(height: 10),
              Converter(
                onPressed: konversiSuhu,
              ),
              const SizedBox(height: 10),
              const Text(
                'Riwayat Konversi',
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 10),
              History(listHasil: listHasil),
            ],
          ),
        ),
      ),
    );
  }

  void konversiSuhu() {
    return setState(() {
      if (etInput.text.isNotEmpty) {
        switch (selectedDropDown) {
          case "Kelvin":
            _output = int.parse(etInput.text) + 273.15;
            listHasil.add("Kelvin");
            break;
          case "Reamur":
            _output = int.parse(etInput.text) * 0.8;
            listHasil.add("Reamur");
            break;
          case "Fahrenheit":
            _output = (int.parse(etInput.text) * 1.8) + 32;
            listHasil.add("Fahrenheit");
            break;
        }
        listHasil.add(
            "Konversi dari ${etInput.text} Celcius ke $selectedDropDown = $_output");
      }
    });
  }

  void onDropdownChanged(Object? value) {
    return setState(() {
      selectedDropDown = value.toString();
    });
  }
}

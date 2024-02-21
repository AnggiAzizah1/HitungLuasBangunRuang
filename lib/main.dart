import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    title: 'Hitung Luas Bangun Ruang',
    home: BangunRuangCalculator(),
  ));
}

class BangunRuangCalculator extends StatefulWidget {
  @override
  _BangunRuangCalculatorState createState() => _BangunRuangCalculatorState();
}

class _BangunRuangCalculatorState extends State<BangunRuangCalculator> {
  final TextEditingController _panjangController = TextEditingController();
  final TextEditingController _sisiController = TextEditingController();
  final TextEditingController _lebarController = TextEditingController();
  final TextEditingController _tinggiController = TextEditingController();
   final TextEditingController _tinggiTabungController = TextEditingController();
  final TextEditingController _jariJariController = TextEditingController();

  double _luasBalok = 0.0;
  double _luasKubus = 0.0;
  double _luasTabung = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hitung Luas Bangun Ruang'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('Balok', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            TextField(
              controller: _panjangController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Panjang'),
            ),
            TextField(
              controller: _lebarController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Lebar'),
            ),
            TextField(
              controller: _tinggiController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Tinggi'),
            ),
            SizedBox(height: 10),
            Text('Kubus', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            TextField(
              controller: _sisiController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Sisi'),
            ),
            SizedBox(height: 10),
            Text('Tabung', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            TextField(
              controller: _jariJariController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Jari-jari'),
            ),
            TextField(
              controller: _tinggiTabungController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Tinggi'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _hitungLuas,
              child: Text('Hitung Luas'),
            ),
            SizedBox(height: 20),
            Text('Luas Balok: $_luasBalok'),
            Text('Luas Kubus: $_luasKubus'),
            Text('Luas Tabung: $_luasTabung'),
          ],
        ),
      ),
    );
  }

  void _hitungLuas() {
    double panjang = double.tryParse(_panjangController.text) ?? 0.0;
    double lebar = double.tryParse(_lebarController.text) ?? 0.0;
    double tinggi = double.tryParse(_tinggiController.text) ?? 0.0;
    double tinggiTabung = double.tryParse(_tinggiTabungController.text) ?? 0.0;
    double sisi = double.tryParse(_sisiController.text) ?? 0.0;
    double jariJari = double.tryParse(_jariJariController.text) ?? 0.0;

    setState(() {
      _luasBalok = panjang * lebar * tinggi;
      _luasKubus = 6 * (sisi*sisi);
      _luasTabung = 2 * pi * jariJari * (jariJari + tinggiTabung);
    });
  }
}

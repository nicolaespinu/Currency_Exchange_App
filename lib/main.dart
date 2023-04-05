import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CurrencyConvertor(title: 'Currency convertor'),
    );
  }
}

class CurrencyConvertor extends StatefulWidget {
  const CurrencyConvertor({super.key, required this.title});

  final String title;

  @override
  State<CurrencyConvertor> createState() => _CurrencyConvertorState();
}

class _CurrencyConvertorState extends State<CurrencyConvertor> {
  final double _bnrRates = 4.50;
  double? resultAmount = 0;
  final TextEditingController _inputAmount = TextEditingController();
  String errorMessage = '';
  String outputAmount = '';

  void _convertingEURToRON() {
    setState(() {
      _inputAmount.text == '.'
          ? resultAmount = 0
          : resultAmount = double.tryParse(_inputAmount.text);

      if (resultAmount == null) {
        errorMessage = 'please enter valid number';
        resultAmount = 0;
      } else {
        resultAmount = resultAmount! * _bnrRates;
        errorMessage = '';
      }
      outputAmount = resultAmount!.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          SizedBox(height: 400, child: Image.asset('assets/money.jpg')),
          Container(
            padding: const EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 10.0),
            child: TextField(
              controller: _inputAmount,
              decoration: InputDecoration(
                  hintText: 'enter the amount in EUR',
                  errorText: errorMessage.isEmpty ? null : errorMessage),
            ),
          ),
          MaterialButton(
            onPressed: _convertingEURToRON,
            color: Colors.grey,
            child: const Text('CONVERT!'),
          ),
          Text(
            '$outputAmount' ' RON',
            style: const TextStyle(fontSize: 35),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _text = TextEditingController();
  static final _logger = Logger();
  Map<String,int> _letterCount = {};


  @override
  void initState() {
    super.initState();
    _text.text== '';
    _logger.i('Iniciando NotasScreen');
  }

  void _submitText() {
    _logger.i('Submitted text: ${_text.text}');
    Set<String> letters = _text.text.split('').toSet();
    Map<String,int> letterCount = {};

    for (String letter in _text.text.split('')) {
      if (letterCount.containsKey(letter)) {
        letterCount[letter] = letterCount[letter]! +1;
      } else {
        letterCount[letter] = 1;
      }
    }
    _logger.i('Letters: $letters');
    _logger.i('Letter count: $letterCount');
    // return letterCount;

    setState(() {
      _letterCount = letterCount;
    });
  }

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Text',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitText,
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            if (_letterCount.isNotEmpty)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: _letterCount.entries.map((entry) {
                      return Text('${entry.key}: ${entry.value}');
                    }).toList(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
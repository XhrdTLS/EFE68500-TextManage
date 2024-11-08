import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taller Computación Movil',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const TextManagePage(title: 'Taller Computación Movil'),
    );
  }
}

class TextManagePage extends StatefulWidget {
  const TextManagePage({super.key, required this.title});

  final String title;

  @override
  State<TextManagePage> createState() => _TextManagePageState();
}

class _TextManagePageState extends State<TextManagePage> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Contador de caracteres',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'Escribe lo que quieras a continuación.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              /// Seccion para ingresar texto
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ingresa un texto',
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(10.0),
                ),
                onPressed: () {
                  // Se trabaja con el texto ingresado
                  final text = _controller.text;
                  final letterCount = <String, int>{};
                  for (var char in text.split('')) {
                    letterCount[char] = (letterCount[char] ?? 0) + 1;
                  }
                  setState(() {
                    _result = letterCount.entries.map((e) => '${e.key}: ${e.value}').join(', ');
                  });
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.auto_fix_high),
                    SizedBox(width: 10),
                    Text('Haz Magia', style: TextStyle(fontSize: 20),),
                  ],
                ),
              ),
              
              /// Seccion para mostrar el resultado
              if (_result.isNotEmpty) ...[
                const SizedBox(height: 16),
                Card(
                  color: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xFFDDDDDD), width: 2),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("Resultados: \n$_result", style: const TextStyle(fontSize: 16),),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

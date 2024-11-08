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
                'Contador de letras',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'Escribe lo que quieras a continuación.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ingresa un texto',
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.all(20),
                ),
                onPressed: () {
                  // Espacio Trabajar con el texto ingresado
                  print('Texto ingresado: ${_controller.text}');
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Icon(Icons.auto_fix_high),
                    SizedBox(width: 10),
                    Text('Haz Magia'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddNumbersScreen(),
    );
  }
}

class AddNumbersScreen extends StatefulWidget {
  const AddNumbersScreen({super.key});

  @override
  State<AddNumbersScreen> createState() => _AddNumbersScreenState();
}

class _AddNumbersScreenState extends State<AddNumbersScreen> {
  static const platform = MethodChannel('com.example.addition');
  int _result = 0;

  final TextEditingController _firstNumberController = TextEditingController();
  final TextEditingController _secondNumberController = TextEditingController();

  Future<void> _calculateSum() async {
    try {
      final int result = await platform.invokeMethod('add', {
        'a': int.parse(_firstNumberController.text),
        'b': int.parse(_secondNumberController.text),
      });
      setState(() {
        _result = result;
      });
    } on PlatformException catch (e) {
      print("Failed to calculate sum: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Addition App using Method Channel')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _firstNumberController,
              decoration: const InputDecoration(labelText: 'First Number'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _secondNumberController,
              decoration: const InputDecoration(labelText: 'Second Number'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateSum,
              child: const Text('Calculate Sum'),
            ),
            const SizedBox(height: 20),
            Text('Result: $_result', style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}

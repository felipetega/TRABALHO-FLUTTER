import 'package:flutter/material.dart';
import 'dart:math';

class CirculoPage extends StatefulWidget {
  const CirculoPage({super.key});

  @override
  State<CirculoPage> createState() => _CirculoPageState();
}

class _CirculoPageState extends State<CirculoPage> {
  final TextEditingController raioController = TextEditingController();
  double? area;

  void calcularArea() {
    final raio = double.tryParse(raioController.text) ?? 0;
    setState(() {
      area = pi * pow(raio, 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo de Área do Círculo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Digite o valor do raio para calcular a área do círculo:',
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: raioController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Raio',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularArea,
              child: const Text('Calcular Área'),
            ),
            const SizedBox(height: 20),
            if (area != null)
              Text(
                'Área do Círculo: ${area!.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}

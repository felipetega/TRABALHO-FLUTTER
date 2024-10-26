import 'package:flutter/material.dart';

class RetanguloPage extends StatefulWidget {
  const RetanguloPage({super.key});

  @override
  State<RetanguloPage> createState() => _RetanguloPageState();
}

class _RetanguloPageState extends State<RetanguloPage> {
  final TextEditingController alturaController = TextEditingController();
  final TextEditingController baseController = TextEditingController();
  double? area;
  double? perimetro; // Variável para armazenar o perímetro

  void calcularAreaEPerimetro() {
    final altura = double.tryParse(alturaController.text) ?? 0;
    final base = double.tryParse(baseController.text) ?? 0;

    setState(() {
      area = altura * base; // Cálculo da área
      perimetro = 2 * (base + altura); // Cálculo do perímetro
    });
  }

  @override
  void dispose() {
    alturaController.dispose();
    baseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo de Área e Perímetro do Retângulo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Digite os valores de altura e base para calcular a área e o perímetro do retângulo:',
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Altura',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: baseController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Base',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularAreaEPerimetro,
              child: const Text('Calcular Área e Perímetro'),
            ),
            const SizedBox(height: 20),
            if (area != null)
              Text(
                'Área do Retângulo: ${area!.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            if (perimetro != null)
              Text(
                'Perímetro do Retângulo: ${perimetro!.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}

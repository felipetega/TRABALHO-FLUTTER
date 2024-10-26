import 'package:flutter/material.dart';

class ParalelogramoPage extends StatefulWidget {
  const ParalelogramoPage({super.key});

  @override
  State<ParalelogramoPage> createState() => _ParalelogramoPageState();
}

class _ParalelogramoPageState extends State<ParalelogramoPage> {
  final TextEditingController alturaController = TextEditingController();
  final TextEditingController baseController = TextEditingController();
  final TextEditingController ladoController = TextEditingController(); // Para o lado do paralelogramo
  double? area;
  double? perimetro; // Variável para armazenar o perímetro

  void calcularAreaEPerimetro() {
    final altura = double.tryParse(alturaController.text) ?? 0;
    final base = double.tryParse(baseController.text) ?? 0;
    final lado = double.tryParse(ladoController.text) ?? 0;

    setState(() {
      area = base * altura; // Cálculo da área
      perimetro = 2 * (base + lado); // Cálculo do perímetro
    });
  }

  @override
  void dispose() {
    alturaController.dispose();
    baseController.dispose();
    ladoController.dispose(); // Dispose do ladoController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo de Área do Paralelogramo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Digite os valores de base, altura e lado para calcular a área e o perímetro do paralelogramo:',
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: baseController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Base',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
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
              controller: ladoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Lado',
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
                'Área do Paralelogramo: ${area!.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            if (perimetro != null)
              Text(
                'Perímetro do Paralelogramo: ${perimetro!.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}

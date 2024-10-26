import 'package:flutter/material.dart';
import 'dart:math';

class LosangoPage extends StatefulWidget {
  const LosangoPage({super.key});

  @override
  _LosangoPageState createState() => _LosangoPageState();
}

class _LosangoPageState extends State<LosangoPage> {
  final _formKey = GlobalKey<FormState>();
  final _diagonalMaiorController = TextEditingController();
  final _diagonalMenorController = TextEditingController();
  double? _area;
  double? _perimetro; // Variável para armazenar o perímetro

  void _calcularAreaEPerimetro() {
    if (_formKey.currentState?.validate() ?? false) {
      final diagonalMaior = double.parse(_diagonalMaiorController.text);
      final diagonalMenor = double.parse(_diagonalMenorController.text);

      setState(() {
        // Cálculo da área
        _area = (diagonalMaior * diagonalMenor) / 2;

        // Cálculo do lado do losango
        final lado = sqrt(pow(diagonalMaior / 2, 2) + pow(diagonalMenor / 2, 2));

        // Cálculo do perímetro
        _perimetro = 4 * lado;
      });
    }
  }

  @override
  void dispose() {
    _diagonalMaiorController.dispose();
    _diagonalMenorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo do Losango'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _diagonalMaiorController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Diagonal Maior (D)',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a diagonal maior';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Informe um valor numérico válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _diagonalMenorController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Diagonal Menor (d)',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a diagonal menor';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Informe um valor numérico válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _calcularAreaEPerimetro,
                child: const Text('Calcular Área e Perímetro'),
              ),
              const SizedBox(height: 24),
              if (_area != null)
                Text(
                  'Área do Losango: ${_area?.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              if (_perimetro != null)
                Text(
                  'Perímetro do Losango: ${_perimetro?.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

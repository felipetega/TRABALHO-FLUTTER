import 'package:flutter/material.dart';
import 'dart:math';

class HexagonoPage extends StatefulWidget {
  const HexagonoPage({super.key});

  @override
  _HexagonoPageState createState() => _HexagonoPageState();
}

class _HexagonoPageState extends State<HexagonoPage> {
  final _formKey = GlobalKey<FormState>();
  final _ladoController = TextEditingController();
  double? _area;
  double? _perimetro; // Variável para armazenar o perímetro

  void _calcularAreaEPerimetro() {
    if (_formKey.currentState?.validate() ?? false) {
      final lado = double.parse(_ladoController.text);
      setState(() {
        // Cálculo da área
        _area = (3 * sqrt(3) / 2) * pow(lado, 2);
        // Cálculo do perímetro
        _perimetro = 6 * lado;
      });
    }
  }

  @override
  void dispose() {
    _ladoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo do Hexágono'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _ladoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Comprimento do Lado (a)',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o comprimento do lado';
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
                  'Área do Hexágono: ${_area?.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              if (_perimetro != null)
                Text(
                  'Perímetro do Hexágono: ${_perimetro?.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

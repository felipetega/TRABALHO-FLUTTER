import 'package:flutter/material.dart';

class TrianguloPage extends StatefulWidget {
  const TrianguloPage({super.key});

  @override
  _TrianguloPageState createState() => _TrianguloPageState();
}

class _TrianguloPageState extends State<TrianguloPage> {
  final _formKey = GlobalKey<FormState>();
  final _ladoAController = TextEditingController();
  final _ladoBController = TextEditingController();
  final _ladoCController = TextEditingController();
  double? _area;
  double? _perimetro;

  void _calcularAreaEPerimetro() {
    if (_formKey.currentState?.validate() ?? false) {
      final ladoA = double.parse(_ladoAController.text);
      final ladoB = double.parse(_ladoBController.text);
      final ladoC = double.parse(_ladoCController.text);

      setState(() {
        _area = (ladoA * ladoB) / 2; // Considerando um triângulo retângulo para a área, ajuste se necessário.
        _perimetro = ladoA + ladoB + ladoC;
      });
    }
  }

  @override
  void dispose() {
    _ladoAController.dispose();
    _ladoBController.dispose();
    _ladoCController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo do Triângulo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _ladoAController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Comprimento do Lado A',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o comprimento do lado A';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Informe um valor numérico válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _ladoBController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Comprimento do Lado B',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o comprimento do lado B';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Informe um valor numérico válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _ladoCController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Comprimento do Lado C',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o comprimento do lado C';
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
                  'Área do Triângulo: ${_area?.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              if (_perimetro != null)
                Text(
                  'Perímetro do Triângulo: ${_perimetro?.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

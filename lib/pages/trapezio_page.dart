import 'package:flutter/material.dart';

class TrapezioPage extends StatefulWidget {
  const TrapezioPage({super.key});

  @override
  _TrapezioPageState createState() => _TrapezioPageState();
}

class _TrapezioPageState extends State<TrapezioPage> {
  final _formKey = GlobalKey<FormState>();
  final _baseMaiorController = TextEditingController();
  final _baseMenorController = TextEditingController();
  final _alturaController = TextEditingController();
  final _lado1Controller = TextEditingController();
  final _lado2Controller = TextEditingController();
  double? _area;
  double? _perimetro;

  void _calcularAreaEPerimetro() {
    if (_formKey.currentState?.validate() ?? false) {
      final baseMaior = double.parse(_baseMaiorController.text);
      final baseMenor = double.parse(_baseMenorController.text);
      final altura = double.parse(_alturaController.text);
      final lado1 = double.parse(_lado1Controller.text);
      final lado2 = double.parse(_lado2Controller.text);

      setState(() {
        _area = ((baseMaior + baseMenor) * altura) / 2; // Cálculo da área
        _perimetro = baseMaior + baseMenor + lado1 + lado2; // Cálculo do perímetro
      });
    }
  }

  @override
  void dispose() {
    _baseMaiorController.dispose();
    _baseMenorController.dispose();
    _alturaController.dispose();
    _lado1Controller.dispose();
    _lado2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo do Trapézio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _baseMaiorController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Base Maior (B)',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a base maior';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Informe um valor numérico válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _baseMenorController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Base Menor (b)',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a base menor';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Informe um valor numérico válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _alturaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Altura (h)',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a altura';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Informe um valor numérico válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _lado1Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Lado 1',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o lado 1';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Informe um valor numérico válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _lado2Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Lado 2',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o lado 2';
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
                  'Área do Trapézio: ${_area?.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              if (_perimetro != null)
                Text(
                  'Perímetro do Trapézio: ${_perimetro?.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

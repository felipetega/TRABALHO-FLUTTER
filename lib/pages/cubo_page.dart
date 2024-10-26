import 'package:flutter/material.dart';

class CuboPage extends StatefulWidget {
  const CuboPage({super.key});

  @override
  _CuboPageState createState() => _CuboPageState();
}

class _CuboPageState extends State<CuboPage> {
  final _formKey = GlobalKey<FormState>();
  final _arestaController = TextEditingController();
  double? _volume;

  void _calcularVolume() {
    if (_formKey.currentState?.validate() ?? false) {
      final aresta = double.parse(_arestaController.text);
      setState(() {
        _volume = aresta * aresta * aresta; // ou pow(aresta, 3);
      });
    }
  }

  @override
  void dispose() {
    _arestaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo do Cubo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _arestaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Comprimento da Aresta (a)',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o comprimento da aresta';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Informe um valor numérico válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _calcularVolume,
                child: const Text('Calcular Volume'),
              ),
              const SizedBox(height: 24),
              if (_volume != null)
                Text(
                  'Volume do Cubo: ${_volume?.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

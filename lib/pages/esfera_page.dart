import 'package:flutter/material.dart';
import 'dart:math';

class EsferaPage extends StatefulWidget {
  const EsferaPage({super.key});

  @override
  _EsferaPageState createState() => _EsferaPageState();
}

class _EsferaPageState extends State<EsferaPage> {
  final _formKey = GlobalKey<FormState>();
  final _raioController = TextEditingController();
  double? _volume;

  void _calcularVolume() {
    if (_formKey.currentState?.validate() ?? false) {
      final raio = double.parse(_raioController.text);
      setState(() {
        _volume = (4 / 3) * pi * pow(raio, 3);
      });
    }
  }

  @override
  void dispose() {
    _raioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo da Esfera'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _raioController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Raio (r)',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o raio';
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
                  'Volume da Esfera: ${_volume?.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

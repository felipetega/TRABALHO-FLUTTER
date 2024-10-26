import 'package:flutter/material.dart';

import 'retangulo_page.dart';
import 'circulo_page.dart';
import 'paralelogramo_page.dart';
import 'losango_page.dart';
import 'trapezio_page.dart';  // Importe a página do Trapézio
import 'esfera_page.dart';    // Importe a página da Esfera
import 'cubo_page.dart';      // Importe a página do Cubo
import 'hexagono_page.dart';  // Importe a página do Hexágono
import 'triangulo_page.dart';  // Importe a página do Triângulo

class FigurasGeometricasPage extends StatelessWidget {
  FigurasGeometricasPage({super.key});

  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  final List<Map<String, dynamic>> figuras = [
    {
      'label': 'Quadrado/Retângulo',
      'color': Colors.blue,
      'page': const RetanguloPage(),
    },
    {
      'label': 'Círculo',
      'color': Colors.green,
      'page': const CirculoPage(),
    },
    {
      'label': 'Paralelogramo',
      'color': Colors.orange,
      'page': const ParalelogramoPage(),
    },
    {
      'label': 'Losango',
      'color': Colors.purple,
      'page': const LosangoPage(),
    },
    {
      'label': 'Trapézio',
      'color': Colors.red,
      'page': const TrapezioPage(),
    },
    {
      'label': 'Esfera',
      'color': Colors.yellow,
      'page': const EsferaPage(),
    },
    {
      'label': 'Cubo',
      'color': Colors.brown,
      'page': const CuboPage(),
    },
    {
      'label': 'Hexágono',
      'color': Colors.teal,
      'page': const HexagonoPage(),
    },
    {
      'label': 'Triângulo',
      'color': Colors.indigo,
      'page': const TrianguloPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Figuras Geométricas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey2,
          child: ListView(
            children: figuras.map((figura) => figuraButton(context, figura)).toList(),
          ),
        ),
      ),
    );
  }

  Widget figuraButton(BuildContext context, Map<String, dynamic> figura) {
    return Container(
      height: 40.0,
      margin: const EdgeInsets.only(top: 10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: figura['color'],
          foregroundColor: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => figura['page']),
          );
        },
        child: Text(
          figura['label'],
          style: const TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
    );
  }
}

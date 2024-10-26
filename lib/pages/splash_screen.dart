import 'package:flutter/material.dart';
import 'dart:async';
import 'login_page.dart'; // Importa a página de login

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Inicia um timer para navegar para a próxima tela após 5 segundos
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()), // Navega para LoginPage
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Cor de fundo
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Adicione seus logotipos aqui
            Image.asset('assets/logos/cps.png', height: 100), // Substitua pelo seu logo
            SizedBox(height: 10),
            Image.asset('assets/logos/fatec.jpg', height: 100), // Substitua pelo seu logo
            SizedBox(height: 10),
            Image.asset('assets/logos/dsm.png', height: 100), // Substitua pelo seu logo
            SizedBox(height: 20),
            const Text(
              'Formas Geométricas', // Substitua pelo seu título
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(), // Ícone de carregamento
            const SizedBox(height: 10),
            const Text('Carregando...'),
            const SizedBox(height: 20),
            const Text('Felipe Crema Ribeiro'),
            const Text('Luiz Rodrigues'),
            const Text('Guilherme Vargas'),
            const SizedBox(height: 20),
            const Text('Versão 1.0', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

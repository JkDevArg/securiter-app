import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';  // Importa la biblioteca

class CBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Floating Buttons Example'),
        ),
        body: FloatingButtons(),
      ),
    );
  }
}

class FloatingButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Tu contenido principal aquí
        Positioned(
          bottom: 16.0,
          left: 16.0,
          child: FloatingButton(
            icon: Icons.memory,
            label: 'Memori',
          ).animate().fadeIn(),  // Aplica la animación
        ),
        Positioned(
          bottom: 16.0,
          left: 96.0,
          child: FloatingButton(
            icon: Icons.battery_full,
            label: 'Batería',
          ).animate().fadeIn().scale(),  // Aplica la animación
        ),
        Positioned(
          bottom: 16.0,
          left: 176.0,
          child: FloatingButton(
            icon: Icons.settings,
            label: 'Configuración',
          ).animate().fadeIn().scale().rotate(),  // Aplica la animación
        ),
        Positioned(
          bottom: 96.0,
          left: 16.0,
          child: FloatingButton(
            icon: Icons.home,
            label: 'Inicio',
          ).animate().fadeIn().scale().shake(),  // Aplica la animación
        ),
      ],
    );
  }
}

class FloatingButton extends StatelessWidget {
  final IconData icon;
  final String label;

  FloatingButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FloatingActionButton(
          onPressed: () {},
          child: Icon(icon),
          backgroundColor: Colors.blue,
          elevation: 5.0,
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

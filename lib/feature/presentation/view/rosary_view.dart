import 'package:flutter/material.dart';

class RosaryView extends StatelessWidget {
  const RosaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: const Text(
          'E-Rosary',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CleaningServicesPage extends StatelessWidget {
  const CleaningServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cleaning Services"),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text(
          "Cleaning services will load from Firebase",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

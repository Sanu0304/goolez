import 'package:flutter/material.dart';

Widget buildTextField(
    String hint,
    IconData icon, {
      bool obscure = false,
      required TextEditingController controller,
    }) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(13),
      color: Colors.white.withOpacity(0.3),
    ),
    child: TextField(
      controller: controller,   // 🔥 ADD THIS
      obscureText: obscure,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white70),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
    ),
  );
}

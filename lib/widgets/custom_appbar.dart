import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar(String name) {
  return AppBar(
    backgroundColor: const Color.fromARGB(255, 26, 82, 118),
    title: Text(
      name,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 25,
      ),
    ),
  );
}

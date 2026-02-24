import 'package:flutter/material.dart';

class AppConstants {
  static const String baseUrl = "https://jsonplaceholder.typicode.com";
  static const String connectionError = "No hay conexión a internet.";
  static const String serverError = "Error en el servidor, intenta mas tarde.";

  static const TextStyle titleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.blueAccent,
  );
}

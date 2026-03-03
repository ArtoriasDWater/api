import 'package:flutter/material.dart';

class AppConstants {
  static const String baseUrl = "https://reqres.in/api";
  static const String loginPath = "/login";
  static const String userPath = "/user";
  static const String connectionError = "No hay conexión a internet.";
  static const String serverError = "Error en el servidor, intenta mas tarde.";

  static const TextStyle titleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.blueAccent,
  );
}

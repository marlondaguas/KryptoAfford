import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:proyectoapp/models/coinCard.dart';
import 'package:http/http.dart' as http;



class Coin {
  Coin({
    required this.nombre,
    required this.simbolo,
    required this.imagenUrl,
    required this.precio,
    required this.cambio,
    required this.cambioPorcentaje,
  });

  String nombre;
  String simbolo;
  String imagenUrl;
  num precio;
  num cambio;
  num cambioPorcentaje;

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      nombre: json['name'],
      simbolo: json['symbol'],
      imagenUrl: json['image'],
      precio: json['current_price'],
      cambio: json['price_change_24h'],
      cambioPorcentaje: json['price_change_percentage_24h'],
    );
  }
}
List<Coin> coinList = [];



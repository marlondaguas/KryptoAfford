import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:proyectoapp/models/coinCard.dart';
import 'package:proyectoapp/models/coin.dart';
import 'package:http/http.dart' as http;



class ListaCoin extends StatefulWidget {
  @override
  _ListaCoins createState() => _ListaCoins();
}

class _ListaCoins extends State<ListaCoin> {
  Future<List<Coin>> fetchCoin() async {
    coinList = [];
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=false'));

    if (response.statusCode == 200) {
      List<dynamic> values = [];
      values = json.decode(response.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            coinList.add(Coin.fromJson(map));
          }
        }
        setState(() {
          coinList;
        });
      }
      return coinList;
    } else {
      throw Exception('Failed to load coins');
    }
  }

  @override
  void initState() {
    fetchCoin();
    Timer.periodic(Duration(seconds: 10), (timer) => fetchCoin());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: coinList.length,
          itemBuilder: (context, index) {
            return CoinCard(
              nombre: coinList[index].nombre,
              simbolo: coinList[index].simbolo,
              imagenUrl: coinList[index].imagenUrl,
              precio: coinList[index].precio.toDouble(),
              cambio: coinList[index].cambio.toDouble(),
              cambioPorcentaje: coinList[index].cambioPorcentaje.toDouble(),
            );
          },
        ));
  }
}
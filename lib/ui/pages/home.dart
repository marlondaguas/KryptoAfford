import 'package:flutter/material.dart';
import 'package:proyectoapp/controllers/login_controller.dart';
import 'dart:async';
import 'dart:convert';
import 'package:proyectoapp/models/coinCard.dart';
import 'package:proyectoapp/models/coin.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {

  final controller = Get.put(LoginController());

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



    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Crypto Afford'),
          backgroundColor: Colors.indigo,
        ),
        endDrawer: Drawer(
          child: Container(
            color: Colors.indigo,
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only( top: 60, bottom: 30 ),
                  child: Image.asset(
                    'lib/ui/images/logo.png',
                  ),
                ),
                Text('Usuario', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only( top: 30 ),
                  padding: EdgeInsets.all(20),
                  color: Colors.grey,
                  child: Text('Tema'),
                  
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  color: Colors.grey,
                  child: Text('Inicio'),
                ),
                Expanded(child: Container()),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  child: TextButton(
                    child: Text('Cerrar Sesion', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                    onPressed:  () async {
                      controller.signOut();
                    },
                  )
                ),
              ],
            ),
          ),
        ),
        
        body: SafeArea(
          child: Column(
            children: [ 
              
              TabBar(
                labelColor: Colors.indigo,
                tabs: [
                  Tab(text: 'ACTIVIDADES'),
                  Tab(text: 'POSTS'),
                  Tab(text: 'POSTEAR'),
                  Tab(text: 'MERCADO'),
              ]),

              Expanded(
                child: TabBarView(
                  children: [
                    Text('Hola asd'),
                    Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10, top: 15,),
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                /*boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 1),
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                  ),
                                ],*/
                              ),
                              child: Row(
                                children: [
                                  
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'post',
                                            style: TextStyle(
                                              color: Colors.grey[900],
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                  
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon( Icons.mode_night),
                    ListView.builder(
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
                    ),
                  ]
                ),
              ),

            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/chat');
        },
        backgroundColor: Colors.indigo,
        tooltip: 'Chat',
        child: const Icon(Icons.chat),
      ),
      ),
    );
  }

  
}


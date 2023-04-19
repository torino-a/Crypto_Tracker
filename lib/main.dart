import 'dart:convert';
import 'dart:async';
import 'package:crypto_tracker/coin_model.dart';
import 'package:flutter/material.dart';
import 'coin_card.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  Future<List<Coin>> fetchCoin() async{
    coinList = [];
    final response = await http.get(Uri.parse('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_capdecs&per_page=100&page=1&sparkline_=false'),);

    if(response.statusCode == 200){
      List<dynamic> values =[];
      values = json.decode(response.body);
      if(values.isNotEmpty){
        for(int i = 0; i < values.length; i++){
          if(values[i]!= null){
            Map<String, dynamic> map = values[i];
            coinList.add(Coin.fromJson(map));
          }
        }
        setState(() {
          coinList;
        });
      }
      return coinList;
    }else{
      throw Exception('Failed to load coins!');
    }
  }

  @override
  void initState() {
   fetchCoin();
   Timer.periodic(const Duration(seconds: 10),(timer) => fetchCoin());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Center(
          child: Text(
            'CRYPTOPRICE',
            style: TextStyle(
              letterSpacing: 2.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey[900],
              fontSize: 20.0,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: coinList.length,
        itemBuilder: (context, index){
          return CoinCard(
              name: coinList[index].name,
              symbol: coinList[index].symbol,
              imageSRC: coinList[index].imageSRC,
              price: coinList[index].price.toDouble(),
              percent: coinList[index].percent.toDouble(),
          );
        },),
    );
  }
}

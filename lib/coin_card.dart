import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {

  const CoinCard({super.key,
    required this.name,
    required this.symbol,
    required this.imageSRC,
    required this.price,
    required this.percent,
  });

  final String name;
  final String symbol;
  final String imageSRC;
  final double price;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0,left: 15.0, right: 15.0),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: (Colors.grey[500])!,
                offset: const Offset(4, 4),
                blurRadius: 10,
                spreadRadius: 1,
              ),
              const BoxShadow(
                color: (Colors.white),
                offset: Offset(-4, -4),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ]),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: (Colors.grey[500])!,
                        offset: const Offset(4, 4),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                      const BoxShadow(
                        color: (Colors.white),
                        offset: Offset(-4, -4),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ]),
                height: 60.0,
                width: 60.0,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.network(
                    imageSRC,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        name,
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      symbol,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    price.toDouble().toString(),
                    style: TextStyle(
                      fontSize: 25.0,
                      color: price.toDouble() < 0 ? Colors.red : Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    percent.toDouble() < 0 ? '-' + percent.toDouble().toString() + ' %': '+' + percent.toDouble().toString() + ' %',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: percent.toDouble() < 0 ? Colors.red : Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

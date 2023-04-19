
class Coin {

  Coin({
    required this.name,
    required this.symbol,
    required this.imageSRC,
    required this.price,
    required this.percent,
  });

  String name;
  String symbol;
  String imageSRC;
  num price;
  num percent;

  factory Coin.fromJson(Map<String, dynamic> json){
    return Coin(
        name: json['name'],
        symbol: json['symbol'],
        imageSRC: json['image'],
        price: json['current_price'],
        percent: json['price_change_percentage_24h'],
    );
  }
}

List<Coin> coinList = [];
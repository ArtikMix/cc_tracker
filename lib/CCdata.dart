class CCdata {
  String name;
  String symbol;
  int cmc_rank;
  double price;

  CCdata(
      {required this.name,
      required this.symbol,
      required this.cmc_rank,
      required this.price});

  factory CCdata.fromJson(Map<String, dynamic> json) {
    return CCdata(
        name: json['name'],
        symbol: json['symbol'],
        cmc_rank: json['cmc_rank'],
        price: json['quote']['USD']['price']);
  }
}

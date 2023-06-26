class CryptoCoin {
  final String name;
  final String imageUrl;
  final String toSymbol;
  final String lastMarket;
  final double priceInUSD;
  final double high24Hours;
  final double lastVolumeTo;

  CryptoCoin(
      {required this.name,
      required this.imageUrl,
      required this.toSymbol,
      required this.lastMarket,
      required this.priceInUSD,
      required this.high24Hours,
      required this.lastVolumeTo});
}

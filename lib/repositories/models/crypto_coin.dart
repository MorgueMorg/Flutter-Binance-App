class CryptoCoin {
  final String name;
  final String imageUrl;
  final String toSymbol;
  final double priceInUSD;
  final double high24Hours;
  final double lastVolumeTo;

  CryptoCoin(
      {required this.imageUrl,
      required this.name,
      required this.toSymbol,
      required this.priceInUSD,
      required this.high24Hours,
      required this.lastVolumeTo});
}

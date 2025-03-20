import 'tangible_asset.dart';

class Computer extends TangibleAsset {
  final String makerName;

  Computer({
    required super.name,
    required super.price,
    required super.color,
    required super.weight,
    required this.makerName,
  });
}

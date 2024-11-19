import 'package:hive/hive.dart';
    part 'model.g.dart';
@HiveType(typeId:0)
class StockModel {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? color;
  @HiveField(2)
  String? catogary;
  @HiveField(3)
  String? quantity;
  @HiveField(4)
  String? date;
  @HiveField(5)
  String? price;
  @HiveField(6)
  String? description;
  @HiveField(7)
  String? image;
  StockModel({
    required this.name,
    required this.color,
    required this.catogary,
    required this.quantity,
    required this.date,
    required this.price,
    required this.description,
    required this.image,
  });
  

}


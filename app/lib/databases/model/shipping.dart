import 'package:hive/hive.dart';
part 'shipping.g.dart';
@HiveType(typeId:2)
class ShippingModel {
  @HiveField(0)
  String? customername;
   @HiveField(1)
  String? email;
   @HiveField(2)
  String? location;
   @HiveField(3)
  String? address;
   @HiveField(4)
  String? quantity;
  @HiveField(5)
  String? name;
  @HiveField(6)
  String? price;
  @HiveField(7)
  String? date;
  @HiveField(8)
  String? catogary;
  @HiveField(9)
  String? image;
  
  ShippingModel({
    required this.customername,
    required this.email,
    required this.location,
    required this.address,
    required this.quantity,
    required this.name,
    required this.price,
    required this.date,
    required this.catogary,
    required this.image,
  });
}
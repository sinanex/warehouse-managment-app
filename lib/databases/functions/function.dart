import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:warehouse/databases/model/model.dart';
import 'package:warehouse/databases/model/shipping.dart';
import 'package:warehouse/databases/model/userdata.dart';

ValueNotifier<List<StockModel>> stockmodelnotifer = ValueNotifier([]);
ValueNotifier<List<ShippingModel>> shippingmodelNotifeir = ValueNotifier([]);

Future<void> getData() async {
  final dataBase = await Hive.openBox<StockModel>('data');
  stockmodelnotifer.value.clear();
  stockmodelnotifer.value.addAll(dataBase.values);
  // ignore: invalid_use_of_protected_member
  stockmodelnotifer.notifyListeners();
}

Future<void> getShippingData() async {
  final box = await Hive.openBox<ShippingModel>('shippingdb');
  shippingmodelNotifeir.value.clear();
  shippingmodelNotifeir.value.addAll(box.values);
  // ignore: invalid_use_of_protected_member
  shippingmodelNotifeir.notifyListeners();
}

Future<void> addData(StockModel value) async {
  final dataBase = await Hive.openBox<StockModel>('data');
  dataBase.add(value);
  getData();
}

Future<void> deleteData(int index) async {
  final dataBase = await Hive.openBox<StockModel>('data');
  await dataBase.deleteAt(index);
  getData();
}

Future<void> editData(int index, StockModel value) async {
  final dataBase = await Hive.openBox<StockModel>('data');
  dataBase.putAt(index, value);
  getData();
}

Future<void> saveProfile(UserData profile) async {
  final box = await Hive.openBox<UserData>('profileBox');
  await box.put('profile', profile);
}

Future<void> updateProfile(UserData profile) async {
  final box = await Hive.openBox<UserData>('profileBox');
  await box.put('profile', profile);
}



Future<void> addShipping(ShippingModel shippingdata) async {
  final box = await Hive.openBox<ShippingModel>('shippingdb');
  await box.add(shippingdata);
  getShippingData();
}

Future<void> deleteShipping(int index) async {
  final box = await Hive.openBox<ShippingModel>('shippingdb');
  box.deleteAt(index);
  getShippingData();
}

final shipping = Hive.box<ShippingModel>('shippingdb');
final shipData = shipping.get('ship');

Future<void> clearData() async {
  final dataBase = await Hive.openBox<StockModel>('data');
  await dataBase.clear();
}

Future<void> shippingDataClear() async {
  final dataBase = await Hive.openBox<ShippingModel>('shippingdb');
  await dataBase.clear();
}


final box = Hive.box<UserData>('profileBox');
final profile = box.get('profile');
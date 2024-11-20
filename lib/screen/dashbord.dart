
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:storeit/databases/functions/function.dart';

class Dashbord extends StatefulWidget {

 Dashbord({super.key});

  @override
  State<Dashbord> createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {
  final List<Color> colorList = [
    Colors.blue,
    Colors.orange,
    Colors.green,  
    Colors.red,
    Colors.yellow,
    Colors.purple

  ];

   final laptop =  'Laptop';
   final mobile = 'Mobile';
   final headset =  'Headphone';
   final  tv =  'Television';
   final speaker = 'Speakers';
   final watch =  'Smart Watches';

  @override
  Widget build(BuildContext context) {
return Scaffold(
  backgroundColor: Colors.white,
  body: ValueListenableBuilder(valueListenable: stockmodelnotifer, builder: (context, value, child) {
   final lap =  value.where((product)=>product.catogary == laptop);
   final phone =  value.where((product)=>product.catogary == mobile);
   final headphone =  value.where((product)=>product.catogary == headset);
   final television =  value.where((product)=>product.catogary == tv);
   final speak =  value.where((product)=>product.catogary == speaker);
   final watchh =  value.where((product)=>product.catogary == watch);

     final Map<String, double> dataMap = {
    "Phone": phone.length.toDouble(),
    "Laptop": lap.length.toDouble(),
    "Headphone": headphone.length.toDouble(),
    "Speakers": speak.length.toDouble(),
    'smart watches': watchh.length.toDouble(),
    'television': television.length.toDouble(),
  };
   return  PieChart(
        key: const Key("pie_chart"), 
        dataMap: dataMap,
        colorList: colorList,
        chartRadius: MediaQuery.of(context).size.width / 2.2,
        legendOptions: const LegendOptions(
          showLegendsInRow: false,
          legendPosition: LegendPosition.right,
          showLegends: true,
          legendShape: BoxShape.circle,
          legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        chartValuesOptions: const ChartValuesOptions(
          showChartValuesInPercentage: true,
          showChartValuesOutside: true,
          decimalPlaces: 1,
        ),
      );
  },),
  
);
  }
}

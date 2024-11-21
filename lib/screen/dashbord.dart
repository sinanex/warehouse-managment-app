import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:storeit/databases/functions/function.dart';

class Dashbord extends StatefulWidget {
  const Dashbord({super.key});

  @override
  State<Dashbord> createState() => _DashbordState();
}

TextEditingController dashbordDate = TextEditingController();
List<String> dropdownItems = [
  'Today',
  'Last 7 day',
  'Last 30 day',
  'Complete',
];
String? _selectedItem;

class _DashbordState extends State<Dashbord> {
  final String laptop = 'Laptop';
  final String mobile = 'Mobile';
  final String headset = 'Headphone';
  final String tv = 'Television';
  final String speaker = 'Speakers';
  final String watch = 'Smart Watches';

  @override
  void initState() {
    super.initState();
    getShippingData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 100),
          Text(
            "Sales",
            style: style(),
          ),
          const SizedBox(height: 50),
          DropdownButton(
            value: _selectedItem,
            hint: const Text("Select Time Range"),
            items: dropdownItems.map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedItem = value;
              });
            },
          ),
          ValueListenableBuilder(
            valueListenable: shippingmodelNotifeir,
            builder: (context, value, child) {
              final now = DateTime.now();

              // Filter data based on the dropdown selection
              final filteredData = value.where((data) {
                final dataDate = data.date != null
                    ? DateTime.tryParse(data.date!)
                    : null;

                if (dataDate == null) return false; // Ignore invalid dates

                switch (_selectedItem) {
                  case 'Today':
                    return isSameDay(dataDate, now);
                  case 'Last 7 day':
                    return dataDate.isAfter(now.subtract(const Duration(days: 7)));
                  case 'Last 30 day':
                    return dataDate.isAfter(now.subtract(const Duration(days: 30)));
                  case 'Complete':
                  default:
                    return true; // Show all data
                }
              }).toList();
              final Map<String, double> dataMap = {
                "Phone": filteredData
                    .where((p) => p.catogary == mobile)
                    .fold(0.0, (sum, p) => sum + (int.parse(p.quantity!))),
                "Laptop": filteredData
                    .where((p) => p.catogary == laptop)
                    .fold(0.0, (sum, p) => sum + (int.parse(p.quantity!))),
                "Headphone": filteredData
                    .where((p) => p.catogary == headset)
                    .fold(0.0, (sum, p) => sum + (int.parse(p.quantity!))),
                "Speakers": filteredData
                    .where((p) => p.catogary == speaker)
                    .fold(0.0, (sum, p) => sum + (int.parse(p.catogary!))),
                'Smart Watches': filteredData
                    .where((p) => p.catogary == watch)
                    .fold(0.0, (sum, p) => sum + (int.parse(p.quantity!))),
                'Television': filteredData
                    .where((p) => p.catogary == tv)
                    .fold(0.0, (sum, p) => sum + (int.parse(p.quantity!))),
              };

              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: PieChart(
                  dataMap: dataMap,
                  chartValuesOptions: const ChartValuesOptions(
                    showChartValueBackground: true,
                    decimalPlaces: 0,
                    showChartValuesOutside: true,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
  TextStyle style() {
    return const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );
  }
}

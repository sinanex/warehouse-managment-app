import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:storeit/databases/functions/function.dart';

class BarChartExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bar Chart"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 50, // Adjusted maximum value dynamically if needed
            barTouchData: BarTouchData(
              enabled: true,
              touchTooltipData: BarTouchTooltipData(
            
                getTooltipItem: (group, groupIndex, rod, rodIndex) {
                  return BarTooltipItem(
                    '${_categoryLabels[group.x.toInt()]}: ${rod.toY.toInt()}',
                    const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 10, // Dynamic intervals based on maxY
                  getTitlesWidget: (value, meta) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        value.toInt().toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  },
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    if (value.toInt() >= _categoryLabels.length) {
                      return Container();
                    }
                    return Text(
                      _categoryLabels[value.toInt()],
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  },
                ),
              ),
            ),
            gridData: FlGridData(show: true, drawVerticalLine: true),
            borderData: FlBorderData(
              show: true,
              border: const Border(
                bottom: BorderSide(color: Colors.black26),
                left: BorderSide(color: Colors.black26),
              ),
            ),
            barGroups: _buildBarGroups(),
          ),
        ),
      ),
    );
  }

  List<String> get _categoryLabels => [
        'Laptop',
        'Mobile',
        'Headphone',
        'Television',
        'Speaker',
        'Smart Watch',
      ];

  List<BarChartGroupData> _buildBarGroups() {
    final data = stockmodelnotifer.value;

    final categoryData = [
      data.where((product) => product.catogary == 'Laptop').length,
      data.where((product) => product.catogary == 'Mobile').length,
      data.where((product) => product.catogary == 'Headphone').length,
      data.where((product) => product.catogary == 'Television').length,
      data.where((product) => product.catogary == 'Speakers').length,
      data.where((product) => product.catogary == 'Smart Watches').length,
    ];

    return List.generate(categoryData.length, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: categoryData[index].toDouble(),
            width: 16,
            borderRadius: BorderRadius.circular(4),
            gradient: LinearGradient(
              colors: [
                Colors.blueAccent.withOpacity(0.8),
                Colors.lightBlueAccent.withOpacity(0.8),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ],
      );
    });
  }
}

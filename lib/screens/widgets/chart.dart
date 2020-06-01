import 'package:charts_flutter/flutter.dart' as charts;
import 'package:coronatiem/screens/totalsCard.dart';
import 'package:flutter/material.dart';

class CoronaChart extends StatelessWidget {
  final List<charts.Series> seriesList;

  CoronaChart(this.seriesList);

  factory CoronaChart.newChart(String color, List<CoronaChartData> chartData) {
    return new CoronaChart(_createChartFromData(chartData, color));
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(seriesList);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<CoronaChartData, String>> _createChartFromData(
      List<CoronaChartData> chartData, String color) {
    return [
      new charts.Series<CoronaChartData, String>(
        colorFn: (_, __) => color == "Y"
            ? charts.MaterialPalette.yellow.shadeDefault
            : color == "G"
                ? charts.MaterialPalette.green.shadeDefault
                : charts.MaterialPalette.red.shadeDefault,
        domainFn: (CoronaChartData chart, _) => chart.date,
        measureFn: (CoronaChartData chart, _) => chart.data,
        data: chartData,
        id: null,
      )
    ];
  }
}

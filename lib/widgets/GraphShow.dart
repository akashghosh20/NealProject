import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ShowGraph extends StatefulWidget {
  ShowGraph({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ShowGraph> {
  List<_SalesData> data = [
    _SalesData('Jan', 35, 100),
    _SalesData('Feb', 28, 90),
    _SalesData('Mar', 34, 80),
    _SalesData('Apr', 32, 70),
    _SalesData('May', 40, 60),
    _SalesData('June', 40, 50),
    _SalesData('July', 40, 40),
    _SalesData('August', 40, 30),
    _SalesData('Sep', 40, 20),
    _SalesData('Oct', 40, 10),
    _SalesData('Nov', 40, 0),
    _SalesData('Dec', 40, -10),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Graph'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Enable horizontal scrolling
        child: SizedBox(
          width: 1000, // Set a fixed width for the chart area
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            // Chart title
            title: ChartTitle(text: 'KWh Analysis'),
            // Enable legend
            legend: Legend(isVisible: true),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),
            // Define multiple axes here
            axes: <ChartAxis>[
              NumericAxis(
                name: 'primaryYAxis',
                title: AxisTitle(text: 'Primary Y-Axis'),
              ),
              NumericAxis(
                name: 'secondaryYAxis',
                title: AxisTitle(text: 'Secondary Y-Axis'),
              ),
            ],
            series: <ChartSeries<_SalesData, String>>[
              // Series with primary Y-axis
              LineSeries<_SalesData, String>(
                dataSource: data,
                xValueMapper: (_SalesData sales, _) => sales.year,
                yValueMapper: (_SalesData sales, _) => sales.sales,
                name: 'KWh (Primary Y-Axis)',
                yAxisName: 'primaryYAxis',
                // Enable data label
                dataLabelSettings: DataLabelSettings(isVisible: true),
              ),
              // Series with secondary Y-axis
              LineSeries<_SalesData, String>(
                dataSource: data,
                xValueMapper: (_SalesData sales, _) => sales.year,
                yValueMapper: (_SalesData sales, _) => sales.temperature,
                name: 'Temperature (Secondary Y-Axis)',
                yAxisName: 'secondaryYAxis',
                // Enable data label
                dataLabelSettings: DataLabelSettings(isVisible: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales, this.temperature);

  final String year;
  final double sales;
  final double temperature;
}

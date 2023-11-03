import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class NutritionValue extends StatefulWidget {
  const NutritionValue({super.key});

  @override
  State<NutritionValue> createState() => _NutritionValueState();
}

class _NutritionValueState extends State<NutritionValue> {
  List<ChartSampleData> chartData = [
    ChartSampleData(
        x: 'Mon', proteins: 50, calorie: 200, fat: 10, carbohydrade: 30),
    ChartSampleData(
        x: 'Tue', proteins: 60, calorie: 250, fat: 15, carbohydrade: 35),
    ChartSampleData(
        x: 'Wed', proteins: 70, calorie: 300, fat: 20, carbohydrade: 40),
    ChartSampleData(
        x: 'Thu', proteins: 80, calorie: 350, fat: 25, carbohydrade: 45),
    ChartSampleData(
        x: 'Fri', proteins: 90, calorie: 400, fat: 30, carbohydrade: 50),
    ChartSampleData(
        x: 'Sat', proteins: 100, calorie: 450, fat: 35, carbohydrade: 55),
    ChartSampleData(
        x: 'Sun', proteins: 110, calorie: 500, fat: 40, carbohydrade: 60),
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: height * 0.02 + width * 0.1,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: width * 0.001 + height * 0.001,
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: height * 0.03 + width * 0.01,
                  color: Colors.grey[400],
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/homepage');
                },
              ),
              SizedBox(
                width: width * 0.15 + height * 0.01,
              ),
              Center(
                child: Text(
                  "Nutrition Tracker",
                  style: TextStyle(
                    fontSize: height * 0.015 + width * 0.02,
                    color: Colors.black,
                    fontFamily: "Comfortaa",
                  ),
                ),
              ),
            ],
          ),
          SfCartesianChart(
            plotAreaBorderWidth: 0,
            title: ChartTitle(text: 'Stacked Column Chart'),
            legend: Legend(isVisible: true),
            primaryXAxis: CategoryAxis(
              majorGridLines: const MajorGridLines(width: 0),
              title: AxisTitle(text: 'X Axis'),
              labelStyle: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
            primaryYAxis: NumericAxis(
              axisLine: const AxisLine(width: 0),
              labelFormat: '{value}',
              maximum: 500,
              majorTickLines: const MajorTickLines(size: 0),
              title: AxisTitle(text: 'Y Axis'),
              labelStyle: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
              labelRotation: 90,
            ),
            series: <StackedColumnSeries<ChartSampleData, String>>[
              StackedColumnSeries<ChartSampleData, String>(
                dataSource: chartData,
                xValueMapper: (ChartSampleData sales, _) => sales.x as String,
                yValueMapper: (ChartSampleData sales, _) =>
                    sales.proteins as num,
                name: 'Proteins',
                dataLabelSettings: DataLabelSettings(
                  color: Colors.black,
                ),
              ),
              StackedColumnSeries<ChartSampleData, String>(
                dataSource: chartData,
                xValueMapper: (ChartSampleData sales, _) => sales.x as String,
                yValueMapper: (ChartSampleData sales, _) =>
                    sales.calorie as num,
                name: 'Calorie',
                dataLabelSettings: DataLabelSettings(
                  color: Colors.black,
                ),
              ),
              StackedColumnSeries<ChartSampleData, String>(
                dataSource: chartData,
                xValueMapper: (ChartSampleData sales, _) => sales.x as String,
                yValueMapper: (ChartSampleData sales, _) => sales.fat as num,
                name: 'Fat',
                dataLabelSettings: DataLabelSettings(
                  color: Colors.black,
                ),
              ),
              StackedColumnSeries<ChartSampleData, String>(
                dataSource: chartData,
                xValueMapper: (ChartSampleData sales, _) => sales.x as String,
                yValueMapper: (ChartSampleData sales, _) =>
                    sales.carbohydrade as num,
                name: 'Carbohydrade',
                dataLabelSettings: DataLabelSettings(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChartSampleData {
  final String x;
  final num proteins;
  final num calorie;
  final num fat;
  final num carbohydrade;

  ChartSampleData(
      {required this.x,
      required this.proteins,
      required this.calorie,
      required this.fat,
      required this.carbohydrade});
}

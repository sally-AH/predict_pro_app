import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:predict_pro/menu/side_menu.dart';
import 'package:rive/rive.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:predict_pro/config/request.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late SMIBool isMenuClosed;

  dynamic data = getData();
  final List<SalesData> charData = [
    SalesData(2019, 34000, Colors.red),
    SalesData(2020, 35000, Colors.blue),
    SalesData(2021, 36000, Colors.green),
    SalesData(2022, 37000, Colors.orange),
    SalesData(2023, 38000, Colors.purple),
  ];

  final List<PieData> pieCharData = [
    PieData("May", 34000, Colors.red),
    PieData("June", 35000, Colors.blue),
    PieData("July", 36000, Colors.green),
    PieData("August", 37000, Colors.orange),
    PieData("September", 38000, Colors.purple),
  ];

  final List<BarData> barCharData = [
    BarData("pr1", 12000, Colors.red),
    BarData("pr2", 32000, Colors.blue),
    BarData("pr3", 74000, Colors.green),
    BarData("pr4", 10000, Colors.orange),
    BarData("pr5", 9000, Colors.purple),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      drawer: SideMenu(),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 149, 255, 100),
        title: Text("Dashboard"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              SfCartesianChart(
                title: ChartTitle(text: 'Yearly Data'),
                series: <ChartSeries>[
                  LineSeries <SalesData, dynamic>(
                      pointColorMapper: (SalesData sales, _)=>sales.color,
                      dataSource: charData,
                      xValueMapper: (SalesData sales, _)=>sales.year,
                      yValueMapper: (SalesData sales, _)=>sales.sales
                  ),
                ],
              ),
              SfCartesianChart(
                title: ChartTitle(text: 'Top Sales'),
                // legend: Legend(isVisible: true),
                primaryXAxis: CategoryAxis(),
                series: <ChartSeries> [
                  StackedColumnSeries<BarData, dynamic>(
                    pointColorMapper: (BarData bar, _)=>bar.color,
                    dataSource: barCharData,
                    xValueMapper: (BarData bar, _)=>bar.product,
                    yValueMapper: (BarData bar, _)=>bar.sales,
                  ),
                ],

              ),
              SfCircularChart(
                title: ChartTitle(text: 'Monthly Sales'),
                legend: Legend(isVisible: true),
                series: [
                  PieSeries<PieData, dynamic>(
                      enableTooltip: true,
                      explode: true,
                      explodeAll: true,
                      radius: '100',
                      dataSource: pieCharData,
                      xValueMapper: (PieData data, _)=>data.month,
                      yValueMapper: (PieData data, _)=>data.sales,
                      dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                      )
                  ),

                ],
              ),
            ],
          ),

        ),
      ),

    );
  }
}
Future getData () async {
  try{
    final response = await sendRequest(route: "prompt");
    print(response);
    // return jsonDecode(response) ;
  }catch(e){
    return e.toString();
  }
}
class SalesData {
  final int year;
  final double sales;
  final Color color;
  SalesData(this.year, this.sales, this.color);
}

class PieData {
  final String month;
  final double sales;
  final Color color;
  PieData(this.month, this.sales, this.color);
}

class BarData {
  final String product;
  final double sales;
  final Color color;
  BarData(this.product, this.sales, this.color);
}


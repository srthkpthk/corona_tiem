import 'package:coronatiem/data/model/StatesData.dart';
import 'package:coronatiem/screens/widgets/chart.dart';
import 'package:flutter/material.dart';

class TotalsCard extends StatefulWidget {
  StatesData data;

  TotalsCard(this.data);

  @override
  _TotalsCardState createState() => _TotalsCardState(data);
}

class _TotalsCardState extends State<TotalsCard> {
  StatesData data;

  _TotalsCardState(this.data);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        buildCard(
            context,
            "Confirmed : ",
            data.statewise[0].deltaconfirmed,
            data.statewise[0].confirmed,
            "Y",
            Colors.yellowAccent,
            _toChartData("CNF")),
        buildCard(
            context,
            "Recovered : ",
            data.statewise[0].deltarecovered,
            data.statewise[0].recovered,
            "G",
            Colors.greenAccent,
            _toChartData("RCV")),
        buildCard(
            context,
            "Deaths : ",
            data.statewise[0].deltadeaths,
            data.statewise[0].deaths,
            "R",
            Colors.redAccent,
            _toChartData("11")),
      ],
    );
  }

  Card buildCard(BuildContext context, String first, sec, thrd, chartColor,
      Color clr, List<CoronaChartData> chartData) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.blueGrey.shade900,
      elevation: 0,
      child: Column(
        children: <Widget>[
          Container(
            height: 8,
          ),
          _textView(first, Colors.white),
          Container(
            height: 10,
          ),
          _textView("+[$sec]", Colors.blueGrey.shade700),
          Container(
            height: 10,
          ),
          _textView(thrd, clr),
          Container(
            width: MediaQuery.of(context).size.width / 3.5,
            height: 150,
            child: CoronaChart.newChart(chartColor, chartData),
          )
        ],
      ),
    );
  }

  Widget _textView(String s, Color c) {
    return Text(
      s,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: c),
    );
  }

  List<CoronaChartData> _toChartData(String string) {
    List<CoronaChartData> returnData = [];

    if (string == "CNF") {
      data.cases_time_series.forEach((element) {
        CoronaChartData _tempData = CoronaChartData(
            date: element.date, data: int.parse(element.dailyconfirmed));
        returnData.add(_tempData);
      });
    } else if (string == "RCV") {
      data.cases_time_series.forEach((element) {
        CoronaChartData _tempData = CoronaChartData(
            date: element.date, data: int.parse(element.dailyrecovered));
        returnData.add(_tempData);
      });
    } else {
      data.cases_time_series.forEach((element) {
        CoronaChartData _tempData = CoronaChartData(
            date: element.date, data: int.parse(element.dailydeceased));
        returnData.add(_tempData);
      });
    }
    return returnData.sublist(returnData.length - 8);
  }
}

class CoronaChartData {
  final int data;
  final String date;

  CoronaChartData({this.data, this.date});
}

import 'package:coronatiem/data/model/StatesData.dart';
import 'package:flutter/material.dart';

class DistrictTotals extends StatefulWidget {
  Statewise _statewise;

  DistrictTotals(this._statewise);

  @override
  _DistrictTotalsState createState() => _DistrictTotalsState(_statewise);
}

class _DistrictTotalsState extends State<DistrictTotals> {
  Statewise _statewise;

  _DistrictTotalsState(this._statewise);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          buildCard(context, "Confirmed : ", _statewise.deltaconfirmed,
              _statewise.confirmed, Colors.yellowAccent),
          buildCard(context, "Recovered : ", _statewise.deltarecovered,
              _statewise.recovered, Colors.greenAccent),
          buildCard(context, "Deaths : ", _statewise.deltadeaths,
              _statewise.deaths, Colors.redAccent),
        ],
      ),
    );
  }

  Widget buildCard(BuildContext context, String first, sec, thrd, Color clr) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.5,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.blueGrey.shade900,
        elevation: 0,
        child: Column(
          children: <Widget>[
            Container(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _textView(first, Colors.white),
            ),
            Container(
              height: 10,
            ),
            int.parse(sec)== 0
                ? Container()
                : _textView("+[$sec]", Colors.blueGrey.shade700),
            Container(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _textView(thrd, clr),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textView(String s, Color c) {
    return Text(
      s,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: c),
    );
  }
}

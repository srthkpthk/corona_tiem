import 'package:coronatiem/data/model/StatesData.dart';
import 'package:coronatiem/screens/states_screen.dart';
import 'package:flutter/material.dart';

class StatesCard extends StatefulWidget {
  Statewise statewise;

  StatesCard(this.statewise, {Key key}) : super(key: key);

  @override
  _StatesCardState createState() => _StatesCardState(statewise);
}

class _StatesCardState extends State<StatesCard> {
  Statewise statewise;

  _StatesCardState(this.statewise);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => StatesScreen(statewise)));
      },
      child: Card(
        margin: EdgeInsets.all(10),
        color: Colors.blueGrey.shade900,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              //New Cases Wala
              Row(
                children: <Widget>[
                  _buildText(statewise.state.toUpperCase(), Colors.white),
                  Container(
                    width: 10,
                  ),
                  int.parse(statewise.deltaconfirmed) > 0
                      ? Row(
                          children: <Widget>[
                            Container(
                              height: 7,
                              width: 7,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blueGrey.shade700),
                            ),
                            Container(
                              width: 10,
                            ),
                            _buildText(
                                statewise.deltaconfirmed, Colors.yellowAccent),
                            Container(
                              width: 10,
                            ),
                            _buildText("New Cases", Colors.blueGrey.shade700),
                          ],
                        )
                      : Container()
                ],
              ),
              //Details wala
              Container(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildColumn(
                        statewise.confirmed, "Confirmed", Colors.yellowAccent),
                    _buildColumn(
                        statewise.recovered, "Recovered", Colors.greenAccent),
                    _buildColumn(statewise.deaths, "Deaths", Colors.redAccent),
                  ],
                ),
              ),
              //StateNotes
              statewise.statenotes == null || statewise.statenotes.isEmpty
                  ? Container()
                  : Row(
                      children: <Widget>[
                        _buildText("Notes", Colors.blueGrey.shade700),
                        Container(
                          width: 10,
                        ),
                        Flexible(
                          child: _buildText(
                              statewise.statenotes.replaceAll("<br>", ""),
                              Colors.blueGrey.shade700),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildColumn(String first, second, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          first,
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: color),
        ),
        Container(
          height: 10,
        ),
        Text(
          second,
          style: TextStyle(fontSize: 20, color: Colors.blueGrey.shade700),
        )
      ],
    );
  }

  Text _buildText(String text, Color color) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
    );
  }
}

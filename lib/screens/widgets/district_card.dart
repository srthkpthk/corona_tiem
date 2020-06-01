import 'package:coronatiem/data/model/DistrictData.dart';
import 'package:flutter/material.dart';

class DistrictCard extends StatefulWidget {
  DistrictDataBean _districtDataBean;

  DistrictCard(this._districtDataBean);

  @override
  _DistrictCardState createState() => _DistrictCardState(_districtDataBean);
}

class _DistrictCardState extends State<DistrictCard> {
  DistrictDataBean _districtDataBean;

  _DistrictCardState(this._districtDataBean);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                  _buildText(
                      _districtDataBean.district.toUpperCase(), Colors.white),
                  Container(
                    width: 10,
                  ),
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
                    _buildColumn(_districtDataBean.confirmed.toString(),
                        "Confirmed", Colors.yellowAccent),
                    _buildColumn(_districtDataBean.recovered.toString(),
                        "Recovered", Colors.greenAccent),
                    _buildColumn(_districtDataBean.deceased.toString(),
                        "Deaths", Colors.redAccent),
                  ],
                ),
              ),
              //StateNotes
              _districtDataBean.notes == null || _districtDataBean.notes.isEmpty
                  ? Container()
                  : Row(
                      children: <Widget>[
                        _buildText("Notes", Colors.blueGrey.shade700),
                        Container(
                          width: 10,
                        ),
                        Flexible(
                          child: _buildText(
                              _districtDataBean.notes.replaceAll("<br>", ""),
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

import 'package:flutter/material.dart';

class LoadingError extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Loading Failed',
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Retrying',
          ),
        ],
      ),
    );
  }
}

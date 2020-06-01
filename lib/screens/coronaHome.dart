import 'package:coronatiem/bloc/corona_data/corona_data_bloc.dart';
import 'package:coronatiem/data/model/StatesData.dart';
import 'package:coronatiem/screens/totalsCard.dart';
import 'package:coronatiem/screens/widgets/loading_error.dart';
import 'package:coronatiem/screens/widgets/loading_widget.dart';
import 'package:coronatiem/screens/widgets/states_card.dart';
import 'package:coronatiem/utils/styles.dart' as style;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoronaHome extends StatefulWidget {
  @override
  _CoronaHomeState createState() => _CoronaHomeState();
}

class _CoronaHomeState extends State<CoronaHome> {
  CoronaDataBloc _coronaBloc;

  @override
  void initState() {
    _coronaBloc = CoronaDataBloc();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _coronaBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: style.Colors.mainColor,
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Corona',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
            Text(
              'Time',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.yellow),
            ),
          ],
        ),
      ),
      body: BlocBuilder(
        bloc: _coronaBloc,
        // ignore: missing_return
        builder: (_, CoronaDataState state) {
          if (state is InitialCoronaDataState) {
            _coronaBloc.add(LoadData());
            return LoadingWidget();
          }
          if (state is DataLoading) {
            return LoadingWidget();
          }
          if (state is DataError) {
            _coronaBloc.add(LoadData());
            return LoadingError();
          }
          if (state is DataLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: Text(
                    'Totals',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TotalsCard(state.data),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: Text(
                    'States',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: 17,
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          List<Statewise> data = state.data.statewise;
                          data.removeAt(0);
                          return StatesCard(data[index]);
                        }))
              ],
            );
          }
        },
      ),
    );
  }
}

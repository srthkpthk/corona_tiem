import 'package:coronatiem/bloc/district_data/district_data_bloc.dart';
import 'package:coronatiem/data/model/StatesData.dart';
import 'package:coronatiem/screens/widgets/district_card.dart';
import 'package:coronatiem/screens/widgets/district_totals.dart';
import 'package:coronatiem/screens/widgets/loading_error.dart';
import 'package:coronatiem/screens/widgets/loading_widget.dart';
import 'package:coronatiem/utils/styles.dart' as style;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatesScreen extends StatefulWidget {
  Statewise state;

  StatesScreen(this.state, {Key key}) : super(key: key);

  @override
  _StatesScreenState createState() => _StatesScreenState(state);
}

class _StatesScreenState extends State<StatesScreen> {
  DistrictDataBloc _districtDataBloc;
  Statewise statewise;

  _StatesScreenState(this.statewise);

  @override
  void initState() {
    _districtDataBloc = DistrictDataBloc();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _districtDataBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: style.Colors.mainColor,
      appBar: AppBar(
        centerTitle: true,
      ),
      body: BlocBuilder(
          bloc: _districtDataBloc,
          // ignore: missing_return
          builder: (_, DistrictDataState state) {
            if (state is InitialDistrictDataState) {
              _districtDataBloc.add(LoadData(statewise.statecode));
              return LoadingWidget();
            }
            if (state is DataLoading) {
              return LoadingWidget();
            }
            if (state is DataError) {
              _districtDataBloc.add(LoadData(statewise.statecode));
              return LoadingError();
            }
            if (state is DataLoaded) {
              print(state.data[0]);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, top: 30, bottom: 30),
                    child: Text(
                      statewise.state,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  DistrictTotals(statewise),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: state.data.length,
                        itemBuilder: (context, index) {
                          return DistrictCard(state.data[index]);
                        }),
                  )
                ],
              );
            }
          }),
    );
  }
}

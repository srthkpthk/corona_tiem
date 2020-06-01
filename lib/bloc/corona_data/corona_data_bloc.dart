import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coronatiem/data/model/StatesData.dart';
import 'package:coronatiem/data/repository/repository.dart';
import 'package:meta/meta.dart';

part 'corona_data_event.dart';

part 'corona_data_state.dart';

class CoronaDataBloc extends Bloc<CoronaDataEvent, CoronaDataState> {
  AppRepository _repository = AppRepository();

  @override
  CoronaDataState get initialState => InitialCoronaDataState();

  @override
  Stream<CoronaDataState> mapEventToState(CoronaDataEvent event) async* {
    if (event is LoadData) {
      yield DataLoading();
      StatesData data = await _repository.getStatesData();
      if (data != null) {
        yield DataLoaded(data);
      } else
        yield DataError();
    } else {
      yield DataError();
    }
  }
}

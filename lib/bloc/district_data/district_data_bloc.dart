import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coronatiem/data/model/DistrictData.dart';
import 'package:coronatiem/data/repository/repository.dart';
import 'package:meta/meta.dart';

part 'district_data_event.dart';

part 'district_data_state.dart';

class DistrictDataBloc extends Bloc<DistrictDataEvent, DistrictDataState> {
  AppRepository _repository = AppRepository();

  @override
  DistrictDataState get initialState => InitialDistrictDataState();

  @override
  Stream<DistrictDataState> mapEventToState(DistrictDataEvent event) async* {
    if (event is LoadData) {
      yield DataLoading();
      List<DistrictDataBean> data =
          await _repository.getDistrictData(event.statecode);
      if (data != null) {
        print(data);
        yield DataLoaded(data);
      } else
        yield DataError();
    } else {
      yield DataError();
    }
  }
}

part of 'district_data_bloc.dart';

@immutable
abstract class DistrictDataState {}

class InitialDistrictDataState extends DistrictDataState {}

class DataLoaded extends DistrictDataState {
  List<DistrictDataBean> data;

  DataLoaded(this.data);
}

class DataLoading extends DistrictDataState {}

class DataError extends DistrictDataState {}

part of 'district_data_bloc.dart';

@immutable
abstract class DistrictDataEvent {}

class LoadData extends DistrictDataEvent {
  String statecode;

  LoadData(this.statecode);
}

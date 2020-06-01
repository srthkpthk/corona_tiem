part of 'corona_data_bloc.dart';

@immutable
abstract class CoronaDataState {}

class InitialCoronaDataState extends CoronaDataState {}

class DataLoaded extends CoronaDataState {
  StatesData data;

  DataLoaded(this.data);
}

class DataLoading extends CoronaDataState {}

class DataError extends CoronaDataState {}

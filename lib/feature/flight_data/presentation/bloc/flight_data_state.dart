part of 'flight_data_bloc.dart';

@immutable
abstract class FlightDataState {
  final List<FlightDataEntity>? flightData;

  const FlightDataState({this.flightData});
}

class FlightDataInitial extends FlightDataState {}

class FlightDataLoadingState extends FlightDataState {}

class FlightDataFailedState extends FlightDataState {}

class FlightDataDoneState extends FlightDataState {
  const FlightDataDoneState(List<FlightDataEntity> flightData) : super(flightData: flightData);
}

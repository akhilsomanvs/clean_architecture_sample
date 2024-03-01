import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flight_simulator/core/resources/data_state.dart';
import 'package:flight_simulator/feature/flight_data/data/model/flight_data_request_model.dart';
import 'package:flight_simulator/feature/flight_data/domain/entities/flight_data_entity.dart';
import 'package:flight_simulator/feature/flight_data/domain/repository/flight_data_repository.dart';
import 'package:meta/meta.dart';

part 'flight_data_event.dart';

part 'flight_data_state.dart';

class FlightDataBloc extends Bloc<FlightDataEvent, FlightDataState> {
  final FlightDataRepository _repository;

  FlightDataBloc(this._repository) : super(FlightDataInitial()) {
    on<FlightDataFetchEvent>((event, emit) async {
      emit(FlightDataLoadingState());
      final response = await _repository.getFlightData(
        FlightDataRequestModel(flyAt: "22/10/2022", countryArrive: "Singapore", countryDepart: "India"),
      );
      if (response is DataSuccess) {
        emit(FlightDataDoneState(response.data!));
      }
      if (response is DataFailed) {
        emit(FlightDataFailedState());
      }
    });
  }
}

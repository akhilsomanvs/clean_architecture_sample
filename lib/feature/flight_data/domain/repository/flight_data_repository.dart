import 'package:flight_simulator/core/resources/data_state.dart';
import 'package:flight_simulator/feature/flight_data/data/model/flight_data_request_model.dart';
import 'package:flight_simulator/feature/flight_data/domain/entities/flight_data_entity.dart';

abstract class FlightDataRepository {
  Future<DataState<List<FlightDataEntity>>> getFlightData(FlightDataRequestModel model);
}

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flight_simulator/core/resources/data_state.dart';
import 'package:flight_simulator/feature/flight_data/data/model/flight_data_air_in_model.dart';
import 'package:flight_simulator/feature/flight_data/data/model/flight_data_request_model.dart';
import 'package:flight_simulator/feature/flight_data/data/model/flight_data_s_air_model.dart';
import 'package:flight_simulator/feature/flight_data/data/sources/remote/flight_data_api_service.dart';
import 'package:flight_simulator/feature/flight_data/domain/entities/flight_data_entity.dart';
import 'package:flight_simulator/feature/flight_data/domain/repository/flight_data_repository.dart';

class FlightDataRepositoryImpl implements FlightDataRepository {
  final FlightDataApiService _apiService;

  FlightDataRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<FlightDataEntity>>> getFlightData(FlightDataRequestModel model) async {
    final httpResponseAirIn = await _apiService.getAirInFlightData(model: model); //2 seconds

    final httpResponseSAir = await _apiService.getSAirFlightData( // 3 seconds
      flightData: model.flyAt,
      from: model.countryDepart,
      to: model.countryArrive,
    );

    try {
      if (httpResponseSAir.response.statusCode == HttpStatus.ok && httpResponseAirIn.response.statusCode == HttpStatus.ok) {
        final FlightDataSAIRModel dataSAirModel = httpResponseSAir.data;
        final List<FlightDataAirINModel> listAirIn = httpResponseAirIn.data;
        final List<FlightDataEntity> entitiesList = [];
        entitiesList.addAll(listAirIn.map((e) => FlightDataEntity(e.flightNumber, e.flightDate, e.departAt, e.arriveAt, e.departureAirport, e.arrivalAirport, (e.price ??= 0).toDouble())).toList());
        if (dataSAirModel.queryResults != null && dataSAirModel.queryResults!.isNotEmpty) {
          entitiesList.addAll(dataSAirModel.queryResults!.map((e) => FlightDataEntity(e.flightId, e.flightDate, e.departureTime, e.arrivalTime, e.from, e.to, (e.price ??= 0).toDouble())).toList());
        }
        return DataSuccess(entitiesList);
      } else {
        final response = httpResponseSAir.response;
        return DataFailed(DioException(requestOptions: response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}

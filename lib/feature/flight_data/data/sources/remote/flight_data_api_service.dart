import 'package:flight_simulator/core/constants/constants.dart';
import 'package:flight_simulator/feature/flight_data/data/model/flight_data_air_in_model.dart';
import 'package:flight_simulator/feature/flight_data/data/model/flight_data_request_model.dart';
import 'package:flight_simulator/feature/flight_data/data/model/flight_data_s_air_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'flight_data_api_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class FlightDataApiService {

  factory FlightDataApiService({required Dio dio}) => _FlightDataApiService(dio);

  @GET('/3c3b32f9-3880-4fcf-8de7-c349c415f07f')
  Future<HttpResponse<FlightDataSAIRModel>> getSAirFlightData({
    @Query('flightDate') String? flightData,
    @Query('from') String? from,
    @Query('to') String? to,
  });

  @POST('/9aae2105-0105-4fad-8b78-11cb72e8dfe7')
  Future<HttpResponse<List<FlightDataAirINModel>>> getAirInFlightData({
    @Body() required FlightDataRequestModel model,
  });
}

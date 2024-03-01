import 'package:flight_simulator/feature/flight_data/data/repository/flight_data_repository_impl.dart';
import 'package:flight_simulator/feature/flight_data/data/sources/remote/flight_data_api_service.dart';
import 'package:flight_simulator/feature/flight_data/presentation/bloc/flight_data_bloc.dart';
import 'package:flight_simulator/feature/flight_data/presentation/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FlightDataBloc>(
      create: (context) => FlightDataBloc(FlightDataRepositoryImpl(FlightDataApiService(dio: Dio())))..add(FlightDataFetchEvent()),
      lazy: false,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

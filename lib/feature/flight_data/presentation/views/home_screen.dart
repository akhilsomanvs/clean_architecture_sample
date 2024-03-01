import 'package:flight_simulator/feature/flight_data/presentation/bloc/flight_data_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<FlightDataBloc, FlightDataState>(
        builder: (context, state) {
          if (state is FlightDataLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FlightDataFailedState) {
            return Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(width: 1)),
                child: const Text("Could not get details. Please try again"),
              ),
            );
          } else if (state is FlightDataDoneState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.flightData!.length,
                    itemBuilder: (context, index) {
                      final item = state.flightData![index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(width: 1)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Flight ID : ${item.flightId.toString()}",
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                  ),
                                  Text(
                                    "Price : ${item.price.toString()}",
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Depart At: ${item.departureTime.toString()}"),
                                  Text("Arrival At: ${item.arrivalTime.toString()}"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      )),
    );
  }
}

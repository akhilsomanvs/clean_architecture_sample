class FlightDataAirINModel {
  String? flightNumber;
  String? flightDate;
  double? price;
  String? departAt;
  String? arriveAt;
  String? departureAirport;
  String? arrivalAirport;

  FlightDataAirINModel({this.flightNumber, this.flightDate, this.price, this.departAt, this.arriveAt, this.departureAirport, this.arrivalAirport});

  FlightDataAirINModel.fromJson(Map<String, dynamic> json) {
    flightNumber = json['flightNumber'];
    flightDate = json['flightDate'];
    price = json['price'];
    departAt = json['departAt'];
    arriveAt = json['arriveAt'];
    departureAirport = json['departureAirport'];
    arrivalAirport = json['arrivalAirport'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flightNumber'] = this.flightNumber;
    data['flightDate'] = this.flightDate;
    data['price'] = this.price;
    data['departAt'] = this.departAt;
    data['arriveAt'] = this.arriveAt;
    data['departureAirport'] = this.departureAirport;
    data['arrivalAirport'] = this.arrivalAirport;
    return data;
  }
}

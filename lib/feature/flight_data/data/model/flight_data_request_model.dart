class FlightDataRequestModel {
  String? flyAt;
  String? countryDepart;
  String? countryArrive;

  FlightDataRequestModel({this.flyAt, this.countryDepart, this.countryArrive});

  FlightDataRequestModel.fromJson(Map<String, dynamic> json) {
    flyAt = json['flyAt'];
    countryDepart = json['countryDepart'];
    countryArrive = json['countryArrive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flyAt'] = this.flyAt;
    data['countryDepart'] = this.countryDepart;
    data['countryArrive'] = this.countryArrive;
    return data;
  }
}

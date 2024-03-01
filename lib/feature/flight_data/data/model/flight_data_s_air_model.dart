class FlightDataSAIRModel {
  String? queryReference;
  List<QueryResults>? queryResults;

  FlightDataSAIRModel({this.queryReference, this.queryResults});

  FlightDataSAIRModel.fromJson(Map<String, dynamic> json) {
    queryReference = json['queryReference'];
    if (json['queryResults'] != null) {
      queryResults = <QueryResults>[];
      json['queryResults'].forEach((v) {
        queryResults!.add(new QueryResults.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['queryReference'] = this.queryReference;
    if (this.queryResults != null) {
      data['queryResults'] = this.queryResults!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QueryResults {
  String? flightId;
  String? flightDate;
  String? departureTime;
  String? arrivalTime;
  String? from;
  String? to;
  double? price;
  String? currency;

  QueryResults(
      {this.flightId,
        this.flightDate,
        this.departureTime,
        this.arrivalTime,
        this.from,
        this.to,
        this.price,
        this.currency});

  QueryResults.fromJson(Map<String, dynamic> json) {
    flightId = json['flightId'];
    flightDate = json['flightDate'];
    departureTime = json['departureTime'];
    arrivalTime = json['arrivalTime'];
    from = json['from'];
    to = json['to'];
    price = json['price'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flightId'] = this.flightId;
    data['flightDate'] = this.flightDate;
    data['departureTime'] = this.departureTime;
    data['arrivalTime'] = this.arrivalTime;
    data['from'] = this.from;
    data['to'] = this.to;
    data['price'] = this.price;
    data['currency'] = this.currency;
    return data;
  }
}


import 'dart:convert';

import 'package:local_api/models/car_model.dart';

List<Car> carModelsFromJson(String str) => List<Car>.from(json.decode(str).map((x) => Car.fromJson(x)));

String carModelsToJson(List<Car> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Car {
    Car({
        required this.carName,
        required this.carYear,
        required this.country,
        required this.carModel,
    });

    final String carName;
    final String carYear;
    final String country;
    final List<CarModel> carModel;

    factory Car.fromJson(Map<String, dynamic> json) => Car(
        carName: json["car_name"],
        carYear: json["car_year"],
        country: json["country"],
        carModel: List<CarModel>.from(json["car_model"].map((x) => CarModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "car_name": carName,
        "car_year": carYear,
        "country": country,
        "car_model": List<dynamic>.from(carModel.map((x) => x.toJson())),
    };
}

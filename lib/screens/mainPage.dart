import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:local_api/models/car_model.dart';
import 'package:local_api/models/cars.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  static const routeName = '/';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final Future<List<Car>> _allCars;
  @override
  void initState(){
    _allCars = getAllCars();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        initialData: [
          Car(carName: 'Skoda', carYear: "2010", country: "Germany", carModel: [CarModel(modelName: "Rapid", price: 2111, isNew: false)], )
        ],
        future: _allCars,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Car> cars = snapshot.data!;
            return ListView.builder(
              itemCount: cars.length,
              itemBuilder: (context, index) {
                Car car = cars[index];
                return ListTile(
                  title: Text(car.carName),
                  subtitle: Text(car.country),
                  leading: CircleAvatar(
                    radius: 59.0,
                    child: Text(car.carModel[0].price.toString()),
                  ),
                );
              },
            );
            } else if(snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } 
          
              else {
                return CircularProgressIndicator();
            
          }
        },
      )
      );
  }

    Future<List<Car>> getAllCars() async {
      await Future.delayed(Duration(seconds: 3));
      String stringData = await DefaultAssetBundle.of(context).loadString('assets/data/cars.json');
      var objectData = jsonDecode(stringData);
      var allData = (objectData as List);
      List<Car> carList =  allData.map((carJson) => Car.fromJson(carJson)).toList();
      return carList;
    }
}
import 'package:cuentasqr/controllers/location_controller.dart';
import 'package:cuentasqr/model/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeatherPage extends StatelessWidget {
  final controller = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LocationController>(
        init: LocationController(),
        builder: (location) {
          if (location.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
              child: FutureBuilder<WeatherModel>(
            future: location.futureWeather,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        snapshot.data!.name.toUpperCase(),
                        style: TextStyle(
                          fontSize: 25,
                          letterSpacing: 5,
                          color: Colors.black87,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        snapshot.data!.sys.country!.toUpperCase(),
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 5,
                          fontWeight: FontWeight.w100,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        snapshot.data!.weather[0].description!.toUpperCase(),
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 5,
                          fontWeight: FontWeight.w900,
                          color: Colors.teal.shade500,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '${snapshot.data!.main.temp!.round()}°',
                        style: TextStyle(
                          fontSize: 25,
                          letterSpacing: 5,
                          color: Colors.blue.shade200,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 20),
                      Image(
                        image: NetworkImage(
                            snapshot.data!.weather[0].icon.toString()),
                      )
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ));
        },
      ),
    );
  }
}

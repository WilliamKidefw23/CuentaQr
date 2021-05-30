class WeatherModel {
  final String name;
  final SystemWeather sys;
  final MainWeather main;
  final List<Weather> weather;

  const WeatherModel({
    required this.name,
    required this.sys,
    required this.main,
    required this.weather,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    var listWeather = json['weather'] as List;
    List<Weather> weatherList =
        listWeather.map((i) => Weather.fromJson(i)).toList();
    return WeatherModel(
        name: json['name'],
        sys: SystemWeather.fromJson(json['sys']),
        main: MainWeather.fromJson(json['main']),
        weather: weatherList);
  }
}

class SystemWeather {
  final int? type;
  final int id;
  final String? country;
  final int? sunrise;
  final int? sunset;

  SystemWeather(
      {required this.type,
      required this.id,
      required this.country,
      required this.sunrise,
      required this.sunset});

  factory SystemWeather.fromJson(Map<String, dynamic> json) {
    return SystemWeather(
      type: json['type'],
      id: json['id'],
      country: json['country'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}

class MainWeather {
  final double? temp;
  final double? feels_like;
  final double? temp_min;
  final double? temp_max;
  final int? pressure;
  final int? humidity;

  MainWeather(
      {required this.temp,
      required this.feels_like,
      required this.temp_min,
      required this.temp_max,
      required this.pressure,
      required this.humidity});

  factory MainWeather.fromJson(Map<String, dynamic> json) {
    return MainWeather(
      temp: json['temp'].toDouble(),
      feels_like: json['feels_like'],
      temp_min: json['temp_min'].toDouble(),
      temp_max: json['temp_max'].toDouble(),
      pressure: json['pressure'],
      humidity: json['humidity'],
    );
  }
}

class Weather {
  final int id;
  final String? main;
  final String? description;
  final String? icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> parsedJson) {
    return Weather(
      id: parsedJson['id'],
      main: parsedJson['main'],
      description: parsedJson['description'],
      icon: parsedJson['icon'],
    );
  }
}

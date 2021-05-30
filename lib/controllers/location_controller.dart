import 'package:cuentasqr/model/weather_model.dart';
import 'package:cuentasqr/service/weather_service.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class LocationController extends GetxController {
  final WeatherRepository _weatherRepository = Get.find<WeatherRepository>();
  final Location location = Location();
  final RxBool _loading = false.obs;
  LocationData? currentPosition;
  late Future<WeatherModel> futureWeather;
  bool get loading => _loading.value;

  onInit() {
    super.onInit();
    getLoc();
  }

  Future<void> getLoc() async {
    _loading.value = true;

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    try {
      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      currentPosition = await location.getLocation();
      location.onLocationChanged.listen((LocationData currentLocation) {
        currentPosition = currentLocation;
        print(
            'currentPosition listen :  ${currentPosition?.latitude} : ${currentPosition?.longitude}');
      });

      futureWeather = _weatherRepository.fetchWeather(
          currentPosition?.latitude, currentPosition?.longitude);

      update();
    } catch (e) {
      e.printError();
    } finally {
      _loading.value = false;
    }
  }
}

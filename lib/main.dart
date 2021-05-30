import 'package:cuentasqr/routes/routes.dart';
import 'package:cuentasqr/service/account_service.dart';
import 'package:cuentasqr/service/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/home',
    initialBinding: BindingsBuilder(() {
      Get.lazyPut(() => WeatherRepository(), fenix: true);
      Get.lazyPut(() => AccountRepository(), fenix: true);
    }),
    navigatorKey: Get.key,
    getPages: routes(),
  ));
}

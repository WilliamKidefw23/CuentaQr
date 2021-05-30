import 'package:cuentasqr/pages/login_page.dart';
import 'package:cuentasqr/pages/home_page.dart';
import 'package:cuentasqr/pages/main_page.dart';
import 'package:cuentasqr/pages/register_login_page.dart';
import 'package:cuentasqr/pages/weather_page.dart';
import 'package:get/get.dart';

routes() => [
      GetPage(name: '/home', page: () => HomePage()),
      GetPage(name: '/registration', page: () => RegisteLoginrPage()),
      GetPage(name: '/loginpage', page: () => LoginPage()),
      GetPage(
          name: '/mainpage',
          page: () => MainPage(),
          transition: Transition.zoom),
      GetPage(
        name: '/weatherpage',
        page: () => WeatherPage(),
        transition: Transition.fadeIn,
      ),
    ];

import 'package:travel_app/services/location.dart';
import 'package:travel_app/services/networking.dart';

const apiKey = 'dc19e55fb2bb283133d48e94b627d1d7';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    Networking networkHelper =
        Networking('$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    Networking networkHelper = Networking(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return '๐ค๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  int getWeatherImage(int condition) {
    if (condition < 300) {
      return 1;
    } else if (condition < 400) {
      return 2;
    } else if (condition < 600) {
      return 3;
    } else if (condition < 700) {
      return 4;
    } else if (condition < 800) {
      return 5;
    } else if (condition == 800) {
      return 6;
    } else if (condition <= 804) {
      return 7;
    } else {
      return 8;
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}

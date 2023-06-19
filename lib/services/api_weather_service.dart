import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
class WeatherService {
  double lattitude = 0;
  double longitude=0;
  getLocation() async{
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    //
    if (!isServiceEnabled) {
      return Future.error("Location not enabled");
    }
    //
    locationPermission = await Geolocator.checkPermission();
    if(locationPermission == LocationPermission.deniedForever){
      return Future.error("Location permission are denied forever");
    }
    else if(locationPermission == LocationPermission.denied){
     locationPermission = await Geolocator.requestPermission();
     if(locationPermission == LocationPermission.denied){
      return Future.error("Location permission are denied");
     }
    }

    //get postion
    return await Geolocator.getCurrentPosition(desiredAccuracy:LocationAccuracy.high);
  }

  getWeatherData() async{
    try {
    Position position = await getLocation();
    String weatherURL = "https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&lang=vi&appid=3a67942e473479c3f86c4b4ca197b4fe";
    Uri uri = Uri.parse(weatherURL);
    var client = http.Client();
    var response = await client.get(uri);
    int status = response.statusCode;
    if(status == 200) {
      return response.body;
    } else {
      return null;
    }
    }catch (_){
      return null;
    }
  }
}
import 'dart:convert';

import 'package:blog/models/weather.dart';
import 'package:blog/services/api_weather_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({super.key});

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  late String weatherData = "";
  Map? map;
  Weather weather = Weather();
  @override
  void initState() {
    //get weather data
    getWeatherData();
    super.initState();
  }

  getWeatherData() async {
    weatherData = await WeatherService().getWeatherData();
    if (mounted) {
      setState(() {
        map = jsonDecode(weatherData);
        List l = map!["weather"];
        List<Weather> a = List<Weather>.from(l.map((e) => Weather.fromMap(e)));
        weather = a.first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (map == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: const Color(0xFF85a9e7),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //weather
            Text(
              map!["name"],
              style: GoogleFonts.nunitoSans(
                  fontSize: 25.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w800),
            ),
            //date time
            Text(
              DateFormat.MEd().format(DateTime.fromMicrosecondsSinceEpoch(
                  ((DateTime.now().millisecondsSinceEpoch) + map!["timezone"])
                          .round() *
                      1000)),
              style: GoogleFonts.nunitoSans(
                  fontSize: 18.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.normal),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.network(
                    "https://openweathermap.org/img/wn/${weather.icon}@2x.png"),
                Container(
                  color: Colors.white54,
                  height: 50,
                  width: 2,
                ),
                // degree C
                Text(
                  "${((double.parse(map!["main"]["temp"].toString()) - 273.15)).round()} °",
                  style: GoogleFonts.nunitoSans(
                      fontSize: 35.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  weather.description!,
                  style: GoogleFonts.nunitoSans(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              ],
            )
          ],
        ),
      );
    }
  }
}

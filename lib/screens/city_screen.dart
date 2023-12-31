// ignore_for_file: must_be_immutable, non_constant_identifier_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/chart.dart';
import 'package:flutter_application_1/constants.dart';
import '../components/column_forecast.dart';
import '../components/weather_parameter.dart';
import '../services/weather.dart';
import 'package:intl/intl.dart';

class CityScreen extends StatefulWidget {
  CityScreen({
    super.key,
    this.cityName,
    this.currentTemp,
    this.localtime,
    // ignore: non_constant_identifier_names
    this.weather_descriptions,
    // ignore: non_constant_identifier_names
    this.wind_speed,
    // ignore: non_constant_identifier_names
    this.wind_degree,
    this.pressure,
    this.humidity,
    this.feelslike,
    this.visibility,
    this.cloudiness,
    this.timeDate,
    this.sea_level,
    this.grnd_level,
    this.temp_min,
    this.temp_max,
    this.iconIndicator,
    this.weatherList,
  });

  String? cityName;
  num? currentTemp;
  String? localtime;
  String? weather_descriptions;
  num? wind_speed;
  int? wind_degree;
  int? pressure;
  int? humidity;
  num? feelslike;
  int? visibility;
  int? cloudiness;
  String? timeDate;
  int? sea_level;
  int? grnd_level;
  num? temp_min;
  num? temp_max;
  String? iconIndicator;
  List<dynamic>? weatherList;

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String cityName = '';
  String result = '';
  bool forecastToggle = false;
  List<TemperatureTimeData> weatherForecastList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 10; i++) {
      weatherForecastList.add(TemperatureTimeData(
          time: DateFormat()
              .add_j()
              .format(DateTime.parse(widget.weatherList![i]['dt_txt'])),
          temp: double.parse(
              (widget.weatherList![i]['main']['temp']!.toInt().toString()))));
    }

    return Scaffold(
      body: widget.currentTemp == 0.0
          ? const Center(child: CircularProgressIndicator())
          : Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  radius: 1.3,
                  stops: [0.4, 3.5],
                  colors: [
                    kDarkViolet,
                    kVeryDarkBlue,
                  ],
                ),
              ),
              child: SafeArea(
                child: Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    widget.cityName ?? cityName,
                                    style: const TextStyle(fontSize: 30.0),
                                  ),
                                  Text(
                                    '${widget.weather_descriptions}',
                                    style: const TextStyle(
                                      fontSize: 23.0,
                                      color: kGrayishBlue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            side: const BorderSide(
                              color: kDarkVioletLighter,
                              width: 1.8,
                            ),
                          ),
                          color: const Color(0x222b2157),
                          margin: const EdgeInsets.all(15.0),
                          child: Padding(
                            padding: const EdgeInsets.all(
                              30.0,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Today',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      DateFormat.MMMMEEEEd().format(
                                          DateTime.parse(widget.weatherList![0]
                                              ['dt_txt'])),
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              (widget.currentTemp!
                                                  .toInt()
                                                  .toString()),
                                              style: const TextStyle(
                                                  fontSize: 70.0,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            const Baseline(
                                              baseline: 0,
                                              baselineType:
                                                  TextBaseline.alphabetic,
                                              child: Text(
                                                '${kCelsiusSign}C',
                                                style: TextStyle(
                                                  fontSize: 30.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: kYellow,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'Feels like ${(widget.currentTemp!.toInt().toString())}${kCelsiusSign}C',
                                          style: const TextStyle(
                                            color: kGrayishBlue,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        right: 20.0,
                                        top: 25.0,
                                      ),
                                      child: Image(
                                        width: 135.0,
                                        image: AssetImage(
                                            WeatherModel.getWeatherImage(widget
                                                .iconIndicator
                                                .toString())),
                                      ),
                                    ),
                                  ],
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      WeatherParameter(
                                        icon: Icons.air,
                                        text: 'Wind',
                                        value: '${widget.wind_speed} km/h',
                                      ),
                                      WeatherParameter(
                                          icon: Icons.water_drop,
                                          text: 'Humidity',
                                          value: '${widget.humidity}%'),
                                      WeatherParameter(
                                          icon: Icons.visibility,
                                          text: 'Visibility',
                                          value: '${widget.visibility}'),
                                      WeatherParameter(
                                          icon: Icons.compare_arrows,
                                          text: 'Pressure',
                                          value: '${widget.pressure}'),
                                      WeatherParameter(
                                          icon: Icons.cloud,
                                          text: 'Cloudiness',
                                          value: '${widget.cloudiness}%'),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.add_location,
                                          size: 30.0,
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          widget.cityName ?? cityName,
                                          style: const TextStyle(
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                              ],
                            ),
                          ),
                        ),

                        //color: Color(0x99452e7d),
                        // color: Color(0xff56319c),
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              stops: [
                                0.1,
                                2.0,
                              ],
                              begin: Alignment(0.0, 0.0),
                              end: Alignment(0.0, 1.0),
                              colors: [
                                kDarkViolet,
                                kDarkestViolet,
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 10,
                                blurRadius: 20,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          width: double.infinity,
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 20.0),
                                child: const Text(
                                  '3 hours / 5 days forecast',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              const Divider(
                                thickness: 3.5,
                                color: kDarkVioletLighter,
                                height: 25.0,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    for (int i = 0;
                                        i < widget.weatherList!.length;
                                        i++)
                                      ColumnForecast(
                                        weekDayName: DateFormat.MMMd().format(
                                            DateTime.parse(widget
                                                .weatherList![i]['dt_txt'])),
                                        dayMonth: DateFormat().add_j().format(
                                            DateTime.parse(widget
                                                .weatherList![i]['dt_txt'])),
                                        assetImage: AssetImage(
                                            WeatherModel.getWeatherImage(
                                                widget.weatherList![i]
                                                    ['weather'][0]['main'])),
                                        degrees: (widget.weatherList![i]['main']
                                                ['temp']!
                                            .toInt()
                                            .toString()),
                                        description:
                                            '${widget.weatherList![i]['weather'][0]['description']}',
                                        minDegrees: (widget.weatherList![i]
                                                ['main']['temp_min']!
                                            .toInt()
                                            .toString()),
                                        maxDegrees: (widget.weatherList![i]
                                                ['main']['temp_max']!
                                            .toInt()
                                            .toString()),
                                        toggle: forecastToggle,
                                        toggleState: () {
                                          setState(() {
                                            forecastToggle = !forecastToggle;
                                          });
                                        },
                                      ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 20.0),
                                child: const Text(
                                  '3 hours forecast',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              const Divider(
                                thickness: 3.5,
                                color: kDarkVioletLighter,
                                height: 25.0,
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  child: Chart(
                                      weatherForecastList:
                                          weatherForecastList)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}

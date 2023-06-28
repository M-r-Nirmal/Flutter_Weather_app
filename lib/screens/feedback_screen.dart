// ignore_for_file: prefer_typing_uninitialized_variables, unused_field, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';

enum WeatherConditionEnum { cloudy, rainy, sunny, snowy }

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  static String feedbackPath = '/feedback';

  bool buttonPressed = false;
  var weatherConditionEnum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        onPressed: () {
          dialogBuilder(context);
        },
        isExtended: true,
        label: const Text('Send feedback'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
        child: Column(
          children: [
            // Text('Your feedback can help everyone see more accurate weather conditions!',
            //   style: TextStyle(fontSize: 18.0),),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleWeatherColumn(
                    func: () {
                      setState(() {
                        weatherConditionEnum = WeatherConditionEnum.cloudy;
                      });
                    },
                    color: weatherConditionEnum == WeatherConditionEnum.cloudy
                        ? const Color(0xFF6336BF)
                        : const Color(0xFF321E66),
                    text: 'Cloudy',
                    img: kCloudyImg,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  CircleWeatherColumn(
                    func: () {
                      setState(() {
                        weatherConditionEnum = WeatherConditionEnum.rainy;
                      });
                    },
                    color: weatherConditionEnum == WeatherConditionEnum.rainy
                        ? const Color(0xFF6336BF)
                        : const Color(0xFF321E66),
                    text: 'Rainy',
                    img: kRainyImg,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleWeatherColumn(
                    func: () {
                      setState(() {
                        weatherConditionEnum = WeatherConditionEnum.sunny;
                      });
                    },
                    color: weatherConditionEnum == WeatherConditionEnum.sunny
                        ? const Color(0xFF6336BF)
                        : const Color(0xFF321E66),
                    text: 'Sunny',
                    img: kSunnyImg,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  CircleWeatherColumn(
                    func: () {
                      setState(() {
                        weatherConditionEnum = WeatherConditionEnum.snowy;
                      });
                    },
                    color: weatherConditionEnum == WeatherConditionEnum.snowy
                        ? const Color(0xFF6336BF)
                        : const Color(0xFF321E66),
                    text: 'Snowy',
                    img: kSnowyImg,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleWeatherColumn extends StatelessWidget {
  String img;
  String text;
  VoidCallback func;
  Color color;

  CircleWeatherColumn(
      {super.key,
      required this.img,
      required this.text,
      required this.func,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: MediaQuery.of(context).size.width * 0.20,
            child: Padding(
                padding: const EdgeInsets.all(30.0), child: Image.asset(img)),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

Future<void> dialogBuilder(BuildContext context) {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Do you really want to send your feedback?'),
          content: const Text(
              'This will help everyone see more accurate wather conditions.'),
          titleTextStyle: const TextStyle(
            color: Colors.black87,
            fontSize: 20.0,
          ),
          contentTextStyle: const TextStyle(
            color: Colors.black87,
            fontSize: 15.0,
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(
                  color: Colors.black87,
                ),
              ),
              child: const Text('Send'),
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check_circle,
                            size: 70.0,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'Done!',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                          Text(
                            'Thank you for your feedback!',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    duration: Duration(seconds: 2),
                    // action: SnackBarAction(
                    //   label: 'UNDO',
                    //   onPressed: () {},
                    // ),
                    backgroundColor: kDarkViolet,
                  ),
                );
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}

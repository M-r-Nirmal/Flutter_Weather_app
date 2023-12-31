import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';

class ColumnForecast extends StatelessWidget {
  const ColumnForecast({super.key, 
    required this.weekDayName,
    required this.dayMonth,
    required this.assetImage,
    required this.degrees,
    required this.description,
    required this.minDegrees,
    required this.maxDegrees,
    required this.toggle,
    required this.toggleState});

  final bool toggle;
  final String weekDayName;
  final String dayMonth;
  final String description;
  final AssetImage assetImage;
  final String degrees;
  final String minDegrees;
  final String maxDegrees;
  final VoidCallback toggleState;


  @override
  Widget build(BuildContext context) {
    List<Widget> forecastLongList = [
      Text(weekDayName),
      const SizedBox(height: 10.0,),
      const SizedBox(height: 5.0,),
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 19.0),
          child: Text(description, style: const TextStyle(fontSize: 12.0, color: Color(0xffa29fbc)),)),
      Container(
        margin: const EdgeInsets.only(
            bottom: 20.0, top: 20.0, left: 5.0, right: 5.0),
        child: Image(
          width: 70.0,
          image: assetImage,
        ),
      ),
      Text(dayMonth, style: const TextStyle(fontSize: 12.0, color: kGrayishBlue)),
      const SizedBox(height: 5.0,),
      Text('$minDegrees$kCelsiusSign'),
      Text('$maxDegrees$kCelsiusSign'),
    ];


    List<Widget> forecastShortList = [
      Column(
        children: [
          Text(weekDayName),
          const SizedBox(height: 5.0,),
          Text('$degrees°',
              style: const TextStyle(
              fontSize: 20.0,
              color: Color(0xffa29fbc),
              fontWeight: FontWeight.w500,
              ),),
          Container(
            margin: const EdgeInsets.only(
                bottom: 20.0, top: 25.0, left: 5.0, right: 5.0),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: Image(
                width: 70.0,
                image: assetImage,
              ),
            ),
          ),
          Text(dayMonth),

        ],
      ),
    ];

    return GestureDetector(
      onTap: toggleState,
      child: Container(
        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(40.0),),
          color: kDarkBlue,
          border: Border.all(
            color: kLightBlue,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 10,
              blurRadius: 20,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        width: 95.0,
        margin: const EdgeInsets.only(left: 18.0, top: 18.0, bottom: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: toggle ? forecastLongList : forecastShortList,
        ),
      ),
    );
  }
}
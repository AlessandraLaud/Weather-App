import 'package:flutter/material.dart';
import 'package:weatherapp/src/providers/weather_provider.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/src/widgets/Temperature.dart';
import 'package:intl/intl.dart';

class Forcast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
        builder: (BuildContext context, WeatherProvider provider, Widget _) {
      return Container(
          child: provider.weather == null
              ? Container(
                  alignment: Alignment(0.0, -0.5),
                  child: Text(
                    "Please search for a city",
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w500),
                  ))
              : Column(
                  children: [
                    Text(provider.weather.locationName,
                        style: TextStyle(
                            fontSize: 35,
                            color: Theme.of(context).accentColor)),
                    Text(
                        'Last updated at ${DateFormat.jm().format(provider.weather.lastUpdated)}',
                        style:
                            TextStyle(fontSize: 15, color: Colors.grey[800])),
                    SizedBox(
                      height: 40,
                    ),
                    Temperature(),
                    SizedBox(
                      height: 40,
                    ),
                    Text(provider.weather.conditionName,
                        style: TextStyle(
                            fontSize: 25,
                            color: Theme.of(context).accentColor)),
                  ],
                ));
    });
  }
}

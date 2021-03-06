import 'package:flutter/material.dart';
import 'package:weatherapp/src/providers/weather_provider.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/src/models/weather_model.dart';

class Temperature extends StatelessWidget {
  Image _mapConditionToImage(WeatherCondition condition) {
    Image image;
    switch (condition) {
      case WeatherCondition.clear:
      case WeatherCondition.lightCloud:
        image = Image.asset('assets/clear.png');
        break;
      case WeatherCondition.hail:
      case WeatherCondition.snow:
      case WeatherCondition.sleet:
        image = Image.asset('assets/snow.png');
        break;
      case WeatherCondition.heavyCloud:
        image = Image.asset('assets/cloudy.png');
        break;
      case WeatherCondition.heavyRain:
      case WeatherCondition.lightRain:
      case WeatherCondition.showers:
        image = Image.asset('assets/rainy.png');
        break;
      case WeatherCondition.thunderstorm:
        image = Image.asset('assets/thunderstorm.png');
        break;
      case WeatherCondition.unknown:
        image = Image.asset('assets/clear.png');
        break;
    }
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
        builder: (BuildContext context, WeatherProvider provider, Widget _) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${provider.weather.temp.toStringAsFixed(0)} \u2109',
                    style: TextStyle(
                        fontSize: 40, color: Theme.of(context).accentColor)),
                Text('Min: ${provider.weather.temp.toStringAsFixed(0)} \u2109',
                    style: TextStyle(
                        fontSize: 14, color: Theme.of(context).accentColor)),
                Text('Max: ${provider.weather.temp.toStringAsFixed(0)} \u2109',
                    style: TextStyle(
                        fontSize: 14, color: Theme.of(context).accentColor)),
              ],
            ),
            _mapConditionToImage(provider.weather.condition),
          ],
        ),
      );
    });
  }
}

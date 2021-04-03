import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/src/pages/forcast.dart';
import 'package:weatherapp/src/providers/weather_provider.dart';
import 'package:weatherapp/src/widgets/Search_bar.dart';

class HomePage extends StatefulWidget {
  final String name;

  HomePage({@required this.name});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (BuildContext context, WeatherProvider provider, Widget _) {
        return Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cloud,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Weather'),
                ],
              ),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            body: Container(
                padding: EdgeInsets.all(16),
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(0.8, 0.0),
                    colors: [
                      Colors.blue[400],
                      Colors.blue[600],
                      Colors.blue[700],
                      Colors.blue[800],
                    ],
                  ),
                ),
                child: RefreshIndicator(
                  backgroundColor: Color.fromRGBO(255, 255, 255, 0.7),
                  color: Theme.of(context).primaryColor,
                  displacement: 5.0,
                  onRefresh: () async {
                    if (provider.locationSet) {
                      provider.refresh();
                    }
                  },
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        SearchBar(controller: _controller),
                        SizedBox(height: 40),
                        provider.isLoading
                            ? Container(
                                child: CircularProgressIndicator(),
                                alignment: Alignment(0.0, -0.5),
                              )
                            : Forcast(),
                      ],
                    ),
                  ),
                )));
      },
    );
  }
}

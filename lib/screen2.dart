// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'screen1.dart';
import 'data_service.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SearchSection());

    ///ElevatedButton(onPressed: () {}, child: null),
  }
}

class SearchSection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchSectionState();
  }
}

class SearchSectionState extends State<SearchSection> {
  final controller = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int temp;
    String desc;
    String cityName;
    void fetchPosts(String city) async {
      try {
        String url = 'https://api.openweathermap.org/data/2.5/weather?q=' +
            city +
            '&appid=30146c58fb2a21d8cc1a0c79bc37928e';
        final response = await get(Uri.parse(url));

        //final data = jsonDecode(response.body) as List;
        //print(response.body);
        final json = jsonDecode(response.body);

        WeatherResponse information = new WeatherResponse.fromJson(json);

        temp = information.temperature.round();
        desc = information.description;
        cityName = information.cityName;

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Screen1(temp, desc, cityName);
        }));
      } catch (err) {
        print(err);
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text("Weather")),
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(border: OutlineInputBorder()
                    //hintText: 'Enter city',
                    ),
              ),
            ),
          ),
          Container(
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  fetchPosts(controller.text);

                  //print(controller.text);
                },
                child: Text("Search"),
              )),
        ],
      ),
    );
    // TODO: implement build
  }
}

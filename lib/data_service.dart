import 'package:http/http.dart' as http;

class WeatherResponse {
  //Weather information
  final String cityName;
  final double temperature;
  final String description;

  WeatherResponse(this.cityName, this.temperature, this.description);

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    //city name
    final cityName = json['name'];
    //print("City name: $cityName");
    //base json for temp
    final tempJson = json['main'];
    //base json for desc
    final descriptionJson = json['weather'][0];

    //create description class to derive description from
    final descriptionClass = Description.fromJson(descriptionJson);
    //create temperature class to derive temp from
    final tempClass = TemperatureInfo.fromJson(tempJson);

    //get temperature in farenheit
    final double temperature = (tempClass.temp - 273.15) * (9 / 5) + 32;
    //get description
    final String description = descriptionClass.desc;

    return WeatherResponse(cityName, temperature, description);
  }
}

class Description {
  final String desc;
  Description(this.desc);

  factory Description.fromJson(Map<String, dynamic> json) {
    String description = json['description'];
    //print("Description: $description");
    return Description(description);
  }
}

class TemperatureInfo {
  final double temp;

  TemperatureInfo(this.temp);

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    //print("Temperature: $temperature");
    return TemperatureInfo(temperature);
  }
}

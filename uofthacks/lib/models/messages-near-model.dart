import 'dart:developer';
import 'dart:convert';
import '../services/messages-near-api-service.dart';

class MessagesNearModel {
  String title;
  List<double> location;

  MessagesNearModel({required this.title, required this.location});

  factory MessagesNearModel.fromJson(Map<String, dynamic> json) {
    return MessagesNearModel(
      title: json['title'] as String,
      location: (json['location'] as List).map((e) => e as double).toList(),
    );
  }

  void fetchData(List<double> position) async {
  try {
      var apiService = MessagesNearApiService("http://localhost:5000"); ////// do something about baseURL
      var response = await apiService.getRequest('/node/nearby', position); // Adjust the endpoint
      var jsonData = json.decode(response.body) as List;
      var locations = jsonData.map((item) => MessagesNearModel.fromJson(item)).toList();

      for (var location in locations) {
        log('Title: ${location.title}, Location: ${location.location}');
      }
      //didnt store data by the way, just logging
    } catch (e) {
      log('Error: $e');
    }
  }
}
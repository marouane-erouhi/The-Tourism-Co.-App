import 'package:flutter/material.dart';
import 'package:hello_world/location_list.dart';
import 'package:hello_world/models/location.dart';
import 'package:hello_world/models/mocks/mock_location.dart';

class App extends StatelessWidget{
  final List<Location> mockLocations = MockLocation.fetchAll();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LocationList(mockLocations)
    );
  }
}
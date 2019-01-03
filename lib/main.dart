import 'package:flutter/material.dart';
import 'models/location.dart';
import 'models/mocks/mock_location.dart';

import 'location_list.dart';

void main() {
  final List<Location> mockLocations = MockLocation.fetchAll();

  return runApp(MaterialApp(
    home: LocationList(mockLocations)
  ));
}

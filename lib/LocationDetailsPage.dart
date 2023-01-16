import 'package:flutter/material.dart';
import 'Location.dart';
import 'LocationDetailsScreen.dart';

class LocationDetailsPage extends Page {
  final Location location;

  LocationDetailsPage({
    required this.location,
  }) : super(key: ValueKey(location));

  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return LocationDetailsScreen(location: location);
      },
    );
  }
}

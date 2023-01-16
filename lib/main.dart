import 'package:flutter/material.dart';
import 'Location.dart';
import 'LocationListScreen.dart';
import 'LocationDetailsPage.dart';

void main() {
  runApp(LocationApp());
}

class LocationApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LocationAppState();
}

class _LocationAppState extends State<LocationApp> {
  Location? _selectedLocation;

  List<Location> locations = [
    Location('Швейцария', 'Вид на гору', 'switz.jpg'),
    Location('Мальдивы', 'Вид на море', 'maldives.jpg'),
    Location('Алтай', 'Вид на озеро', 'altai.jpeg')
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Locations App',
      home: Navigator(
        pages: [
          MaterialPage(
            key: ValueKey('LocationsListPage'),
            child: LocationListScreen(
              locations: locations,
              onTapped: _handleLocationTapped,
            ),
          ),
          if (_selectedLocation != null)
            LocationDetailsPage(location: _selectedLocation!)
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }
          setState(() {
            _selectedLocation = null;
          });
          return true;
        },
      ),
    );
  }

  void _handleLocationTapped(Location location) {
    setState(() {
      _selectedLocation = location;
    });
  }
}

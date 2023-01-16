import 'package:flutter/material.dart';
import 'Location.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'testHero.dart';

class LocationListScreen extends StatelessWidget {
  final List<Location> locations;
  final ValueChanged<Location> onTapped;

  LocationListScreen({
    required this.locations,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    timeDilation = 7.0;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          widthFactor: 2.5,
          child: Text(
            'Список локаций',
            style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: ListView(
        children: [
          for (var location in locations)
            ListTile(
              leading: TestHero(
                  width: 50,
                  height: 50,
                  path: "assets/images/${location.pic}",
                  radius: 30.0),
              title: Text(location.name),
              subtitle: Text(location.description),
              onTap: () => onTapped(location),
            ),
        ],
      ),
    );
  }
}

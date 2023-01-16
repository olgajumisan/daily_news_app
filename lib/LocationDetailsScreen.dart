import 'package:flutter/material.dart';
import 'testHero.dart';
import 'Location.dart';

class LocationDetailsScreen extends StatelessWidget {
  final Location location;

  LocationDetailsScreen({
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          widthFactor: 2.5,
          child: Text(
            location.name,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (location != null) ...[
              TestHero(
                  width: 500,
                  height: 300,
                  path: "assets/images/${location.pic}",
                  radius: 0),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  location.description,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

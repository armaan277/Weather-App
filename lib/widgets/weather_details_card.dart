import 'package:flutter/material.dart';

class WeatherDetailsCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final String country;
  final bool showCountry;
  const WeatherDetailsCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.showCountry = false,
    this.icon,
    this.country = '',
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            showCountry == false
                ? Icon(icon, color: Colors.amber)
                : Text(country),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    '$subtitle',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

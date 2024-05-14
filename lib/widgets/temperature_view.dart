import 'package:flutter/material.dart';

class TemperatureView extends StatelessWidget {
  final double temperatureCelsius;
  final String conditionText;
  final String conditionIconUrl;

  const TemperatureView({
    super.key,
    required this.temperatureCelsius,
    required this.conditionText,
    required this.conditionIconUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$temperatureCelsius°C',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          conditionText,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 10),
        Image.network(
          conditionIconUrl,
          width: 64,
          height: 64,
        ),
      ],
    );
  }
}

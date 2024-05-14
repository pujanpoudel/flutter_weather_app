import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weatherapp/models/weather.dart';
import 'package:weatherapp/screens/help_screen.dart';
import 'package:weatherapp/services/weather_service.dart';
import 'package:weatherapp/widgets/temperature_view.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final TextEditingController _locationController = TextEditingController();
  late String _locationName;
  final WeatherService _weatherService =
      WeatherService(apiKey: dotenv.env["API_KEY"]!);
  Weather? _weatherData;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  void _getLocation() async {
    _locationName = 'kathmandu';
    _locationController.text = _locationName;
    _fetchWeatherData();
  }

  void _fetchWeatherData() async {
    try {
      _weatherData =
          await _weatherService.fetchWeatherByLocation(_locationName);
      setState(() {});
    } catch (e) {
      print('Error fetching weather data: $e');
    }
  }

  void _onSaveUpdatePressed() {
    String newLocation = _locationController.text.trim();
    if (newLocation.isNotEmpty) {
      _locationName = newLocation;
      _fetchWeatherData();
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Location cannot be empty')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.help),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HelpScreen()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(
                labelText: 'Enter Location Name',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _onSaveUpdatePressed,
              child:
                  Text(_locationController.text.isNotEmpty ? 'Update' : 'Save'),
            ),
            const SizedBox(height: 20),
            _weatherData != null
                ? TemperatureView(
                    temperatureCelsius: _weatherData!.temperatureCelsius,
                    conditionText: _weatherData!.conditionText,
                    conditionIconUrl: _weatherData!.conditionIconUrl,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

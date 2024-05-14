class Weather {
  final String locationName;
  final double temperatureCelsius;
  final String conditionText;
  final String conditionIconUrl;

  Weather({
    required this.locationName,
    required this.temperatureCelsius,
    required this.conditionText,
    required this.conditionIconUrl,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      locationName: json['location']['name'],
      temperatureCelsius: json['current']['temp_c'].toDouble(),
      conditionText: json['current']['condition']['text'],
      conditionIconUrl: 'http:' + json['current']['condition']['icon'],
    );
  }
}

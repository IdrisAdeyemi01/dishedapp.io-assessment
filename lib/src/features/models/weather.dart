class Weather {
  Weather({
    required this.temperature,
    required this.description,
    required this.main,
    required this.pressure,
    required this.humidity,
  });
  final double temperature;
  final String description;
  final String main;
  final double pressure;
  final double humidity;

  Weather copyWith({
    double? temperature,
    String? description,
    String? main,
    double? pressure,
    double? humidity,
  }) {
    return Weather(
      temperature: temperature ?? this.temperature,
      description: description ?? this.description,
      main: main ?? this.main,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'temperature': temperature,
      'description': description,
      'main': main,
      'pressure': pressure,
      'humidity': humidity,
    };
  }

  factory Weather.fromJson(Map<String, dynamic> map) {
    return Weather(
      temperature: map["main"]['temp']?.toDouble() ?? 0.0,
      description: map["weather"][0]['description'] ?? '',
      main: map["weather"][0]['main'] ?? '',
      pressure: map["main"]['pressure']?.toDouble() ?? 0.0,
      humidity: map["main"]['humidity']?.toDouble() ?? 0.0,
    );
  }

  @override
  String toString() {
    return 'Weather(temperature: $temperature, description: $description, main: $main, pressure: $pressure, humidity: $humidity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Weather &&
        other.temperature == temperature &&
        other.description == description &&
        other.main == main &&
        other.pressure == pressure &&
        other.humidity == humidity;
  }

  @override
  int get hashCode {
    return temperature.hashCode ^
        description.hashCode ^
        main.hashCode ^
        pressure.hashCode ^
        humidity.hashCode;
  }
}

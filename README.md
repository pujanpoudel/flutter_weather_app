# Flutter Weather App

A simple weather app built with Flutter to display weather information based on location.

## Project Overview

The Flutter Weather App is designed to provide users with current weather information based on their location. It fetches weather data from a weather API and displays it in a user-friendly interface.

### Features

- Splash screen with animation and delay
- Home screen with the ability to enter location name and save/update it
- Fetches weather data automatically with current latitude and longitude if location name is blank
- Displays temperature, weather condition, and icon
- Option to open help screen for additional information

## Getting Started

Follow these instructions to set up and run the project on your local machine.

### Prerequisites

- Flutter SDK installed on your machine
- Android/iOS emulator or a physical device connected for testing

### Installation

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/pujanpoudel/weather_app.git

2. Navigate to the project directory:
bash
Copy code
cd weather_app

3. Install dependencies:
bash
Copy code
flutter pub get

Configuration
1. Obtain a Weather API key from WeatherAPI or any other weather service provider.

2. Create a .env file in the root directory of the project.

3. Add your Weather API key to the .env file:

makefile
Copy code
API_KEY=YOUR_API_KEY_HERE

Usage
1. Run the app on your emulator or device:

bash
Copy code
flutter run

2. The app will start with a splash screen and then navigate to the home screen.

3. Enter a location name or leave it blank to fetch weather data automatically based on your current location.

4. Save the location to see weather information for that location.

Contributing
Contributions are welcome! Please follow these steps to contribute:

License
This project is licensed under the MIT License.

Acknowledgements
Flutter Documentation
WeatherAPI
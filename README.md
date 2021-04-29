# DietControl - Flutter application for custom macronutrients tracking

Flutter application for counting daily calories and macronutrients based on custom user parameters.

## About

The main focus of this project was on using local storage (shared preferences and sqlite) and displaying data in graphs with easy and understandable UI in Flutter. User parameters are stored with shared preferences and meals are stored using SQLite. State management used in this project is Provider with ChangeNotifier.

## Setup
  1. Clone the repository using the link below:
  ```
  https://github.com/kforjan/diet-control.git
  ```
  2. Go to the project root and execute the following commands:
  ```
  flutter pub get
  flutter run
  ```

## Used packages
  * [sqflite](https://pub.dev/packages/sqflite)
  * [shared_preferences](https://pub.dev/packages/shared_preferences)
  * [path](https://pub.dev/packages/path)
  * [provider](https://pub.dev/packages/provider)
  * [fl_chart](https://pub.dev/packages/fl_chart)

## Features
 * Input and storage of custom user parameters locally (weight, height, age...)
 * Automatic determination of recommended daily calories
 * Adding and storing custom meals locally (name of the meal and macronutrients)
 * Deletion of meals from local memory
 * Resetting daily input of calories every 24h
 * Deletion of the user and user data
 * Display of daily intake using the bar and pie chart

## Preview
![DietControl preview](https://s3.gifyu.com/images/meal-app-preview.gif)

## Possible improvements
* Folder structure
* Online user storage
* BloC state management (optional)

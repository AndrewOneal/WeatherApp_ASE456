# Dream Weather App Documentation
# Introduction

## Purpose Of This Document

This documentation serves as a comprehensive guide to understanding the features of our Weather App. It is intended to provide a clear and detailed reference to software engineers (SEs) to understand how the code works and how the app functions.

## App Overview

Our Weather App is a powerful and user-friendly application designed to keep users informed about weather conditions in various locations. It offers a range of features to ensure users are well-prepared for any weather situation. The app is built around several key epics, each of which addresses specific user needs:

1. **Emergency Weather Alerts (Bryce):** Users can receive in-app notifications about emergency weather events in their current location or in cities they search for. This feature helps keep users safe during severe weather conditions.
2. **Weather Notifications (Bryce):** This feature allows users to receive in-app notifications about specific weather conditions in a location of their choice. Users can customize their notifications based on their preferred weather criteria for a given location.
3. **Dark and Light Modes (Seth):** The app offers both dark and light modes with an option to toggle between them. Users can customize their visual experience and choose between automatic mode switching based on the time of day.
4. **Six Day Weather Forecast (Seth):** Users can easily see the forecast for the next six days, making it easy to make plans based on the weather.
5. **Search By Location (Lulsged):** Travelers and outdoor enthusiasts can view weather forecasts for any place by just typing in the locations, making it easy to plan trips or activities in different locations.
6. **Additional Weather Information (Lulsged):** Users can access in-depth weather data, including wind information, to stay well-informed about the weather conditions.
7. **English Weather Interpretations (Andrey):** The app provides quick and clear representations of weather conditions, helping users decide what to wear or plan their activities accordingly.
8. **Current Location Weather for Android (Andrey):** Android users can choose to share their location, allowing the app to provide immediate access to today's weather data for their current location.

In this documentation, we will delve into the architecture, design, and data flow of the Weather App. Each section provides in-depth insights into how the application is structured, the design principles it follows, and the flow of data within the app. The documentation of each feature can be found under the `**Feature Documentation**` section of this document. 

# Getting Started

## Installation

### Running the Weather App Locally

#### Git

To install and run the Weather App on your local machine, follow these steps:

1. **Clone the Repository**
    
    The Weather App's source code is available on GitHub. Clone the repository to your local machine using the following command:
    
    ```
    git clone https://github.com/AndrewOneal/WeatherApp_ASE456
    ```

#### Downloaded Zip

1. **Download and unzip the Repository from Git**

   The Weather App's source code can also be downloaded: https://github.com/AndrewOneal/WeatherApp_ASE456. Just download the code and unzip it.
    
3. **Install Dependencies**
    
    Navigate to the project directory and install the required dependencies. Since this is a Flutter app, you can use Flutter's package manager (pub) to install dependencies. Run the following commands:

   #### Cloned from Git:
    
    ```
    cd WeatherApp_ASE456
    flutter pub get
    ```

   #### Downloaded Zip:

   Open a terminal and navigate to your the downloaded files location, then run the following command:

    ```
    flutter pub get
    ```
   
    
5. **Running the App**
    
    You can run the Weather App on various platforms, including iOS, Android, and web browsers. Use the appropriate command to launch the app on your desired platform:
    
    ```
    flutter run
    ```
    

## App Permissions

### Location Permission

The Weather App requests location permission when it is launched and when users click the `my location` button. This permission is necessary to provide users with accurate and location-specific weather information of their own location. 

## Supported Platforms

The Weather App is developed using Flutter, a versatile framework that allows it to run on multiple platforms, including:

- Android
- Web Browsers

# More

[Feature Documentation](https://github.com/AndrewOneal/WeatherApp_ASE456/tree/main/documentation)

# Code Smell Refactoring

# Lulseged Refractors

## TimUtils class

```
import 'package:intl/intl.dart';

class TimeUtils {
  /// Converts a timestamp to a human-readable time string.
  ///
  /// The [timestamp] parameter is the Unix timestamp in seconds.
  /// Returns a formatted time string in the format 'h:mm a'.
  String convertTimestampToTime(int timestamp) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var formattedTime =
        '${dateTime.hour}:${dateTime.minute}${dateTime.hour >= 12 ? 'pm' : 'am'}';
    return formattedTime;
  }

  /// Gets the current time and formats it in a user-friendly way.
  ///
  /// Returns a formatted current time string in the format 'EEEE d · h:mm a'.
  String getCurrentTime() {
    var now = DateTime.now();
    var formattedTime = DateFormat('EEEE d · h:mm a').format(now);
    return formattedTime;
  }
}
```

- **`TimeUtils`** is a utility class designed to handle time-related operations.
- **`convertTimestampToTime`** method takes a Unix timestamp (in seconds) as input and converts it to a human-readable time format. The result is a string representation of the time in the format 'h:mm a' (e.g., '10:30 am').
- **`getCurrentTime`** method gets the current system time and formats it to a user-friendly string. The format used is 'EEEE d · h:mm a', which includes the day of the week, day of the month, and time (e.g., 'Monday 26 · 10:30 am').

### Why create this class?

1. **Reusability:** The **`TimeUtils`** class can be used across different parts of the app. Since it's not tied to any specific UI component, it can be reused wherever we need time-related functionality.
2. **Maintainability:** If there's a need to change how time is formatted or processed, we only need to modify the **`TimeUtils`** class. This makes it easier to maintain and update our codebase without affecting UI components or other parts of our application.
3. **Readability:** By encapsulating time-related logic in a separate class, our code becomes more readable. When looking at UI components or other classes, my team can focus on the specific functionality of those components without getting bogged down in the details of time manipulation.
4. **Testability:** Since time-related functionality is concentrated in one class, it's easier to write unit tests for the **`TimeUtils`** methods. This promotes testing practices and ensures that the time-related logic behaves as expected.
5. **Consistency:** By using the same **`TimeUtils`** class throughout our application, we ensure consistency in how time is handled. This can help prevent inconsistencies or errors that might arise if different parts of our application use different time-handling logic.

## getWeatherImage method

```
//imports

class WeatherModel {
  // ... Other methods and properties ...

  /// Gets the weather image based on the provided weather condition code.
  /// The [condition] parameter represents the weather condition code.
  /// Returns an Image widget representing the weather image.
  Image getWeatherImage(int condition) {
    // Group 2xx: Thunderstorm
    if (condition >= 200 && condition <= 232) {
      return Image.asset(
        KCustomImages.cloud_thunder,
        width: 70,
        fit: BoxFit.cover,
      );
    }
    // Group 3xx: Drizzle
    else if (condition >= 300 && condition <= 321) {
      return Image.asset(
        KCustomImages.cloud_diagonalRain,
        width: 70,
        fit: BoxFit.cover,
      );
    }
    // Group 5xx: Rain
    else if (condition >= 500 && condition <= 531) {
      return Image.asset(
        KCustomImages.cloud_rain,
        width: 70,
        fit: BoxFit.cover,
      );
    }
    // Group 6xx: Snow
    else if (condition >= 600 && condition <= 631) {
      return Image.asset(
        KCustomImages.cloud_snow,
        width: 70,
        fit: BoxFit.cover,
      );
    }
    // Group 7xx: Atmosphere
    else if (condition >= 700 && condition <= 781) {
      return Image.asset(
        KCustomImages.cloud_wind,
        width: 70,
        fit: BoxFit.cover,
      );
    }
    // Group 8xx: Clear/Clouds
    else if (condition >= 800 && condition <= 804) {
      return condition == 800
          ? Image.asset(
              KCustomImages.sun_normal,
              width: 70,
              fit: BoxFit.cover,
            )
          : Image.asset(
              KCustomImages.cloud,
              width: 70,
              fit: BoxFit.cover,
            );
    }
    // Default image for unknown weather conditions
    return Image.asset(
      KCustomImages.cloud_rain,
      width: 70,
      fit: BoxFit.cover,
    );
  }
}
```

Explanation of the **`getWeatherImage`** method:

- The method takes a **`condition`** parameter, representing the weather condition code.
- Based on the condition code, it returns an **`Image`** widget representing the corresponding weather image .
- Images are loaded using **`Image.asset`** with paths provided by constants defined in the **`constants.dart`** file.
- The method includes comments to explain the weather condition groups and the associated Images.

### Why create this method

The **`getWeatherImage`** method within the **`WeatherModel`** class provides several advantages:

1. **Abstraction of Weather Image Logic:**
    - The method encapsulates the logic for determining the appropriate weather image based on a given weather condition code. This abstraction allows other parts of our application, such as UI components, to use weather images without needing to understand the intricacies of how each image is chosen.
2. **Code Readability:**
    - By placing the logic for obtaining weather images in a dedicated method, our code becomes more readable. Other parts of our application can call **`getWeatherImage`** with a condition code, making it clear that we are obtaining a weather-related asset.
3. **Modularity and Reusability:**
    - The method promotes modularity by providing a self-contained function for obtaining weather images. This promotes reusability since we can use the **`WeatherModel`** class across different components.
4. **Easier Maintenance:**
    - If the logic for determining weather images needs to change or be extended, we only need to modify the **`getWeatherImage`** method. This centralized location for weather-related logic makes maintenance easier and reduces the risk of introducing errors in multiple places.
5. **Testing:**
    - The method provides a clear unit of functionality that can be easily tested. We can write unit tests specifically for the **`getWeatherImage`** method to ensure that it correctly maps weather conditions to the appropriate images.
6. **Consistency Across the Application:**
    - By using a centralized method to obtain weather images, we ensure consistency in how weather-related assets are handled throughout our application. This consistency is important for maintaining a cohesive and professional user experience.
7. **Encapsulation of Complexity:**
    - The method encapsulates the complexity of determining which weather image to use for a given condition. This abstraction allows developers working on other parts of the application to use weather images without needing to understand the details of the image selection process.
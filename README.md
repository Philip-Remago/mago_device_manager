# mago_device_manager

A Flutter package for collecting and managing device information, hardware details, display metrics, location, region, and screenshots across multiple platforms.

## Features

- **Device Information**: Retrieve device identity, OS details, and hardware specs.
- **Display Metrics**: Access screen size, pixel density, and orientation.
- **Location Services**: Get current device location (with permissions).
- **Region Info**: Obtain locale, language, country, and timezone.
- **Screenshot Capture**: Capture screenshots programmatically.
- **Unified Device Model**: Aggregate all device data into a single model.

## Getting Started

Add to your `pubspec.yaml`:

```yaml
dependencies:
  mago_device_manager: ^0.0.1
```

Then run:

```sh
flutter pub get
```

## Usage

Import the package:

```dart
import 'package:mago_device_manager/mago_device_manager.dart';
```

### Example: Get Device Info

```dart
final osService = OperatingSystemService();
final osInfo = await osService.getOperatingSystemInfo();

final identity = await osService.getDeviceIdentity();
```

### Example: Get Display Info

```dart
final displayService = DisplayService();
final displayInfo = displayService.getDisplayInfo(context);
```

### Example: Get Location

```dart
final locationService = LocationService();
final location = await locationService.getCurrentLocation();
```

### Example: Get Region Info

```dart
final regionService = RegionService();
final regionInfo = await regionService.getRegionInfo();
```

### Example: Capture Screenshot

```dart
final screenshotService = ScreenShotService();
final imageBytes = await screenshotService.captureScreen();
```

## API Overview

- **Models**: Device, DeviceIdentity, HardwareInfo, DisplayInfo, OperatingSystemInfo, RegionInfo, etc.
- **Services**:
  - `OperatingSystemService`: OS and device identity.
  - `DisplayService`: Screen metrics.
  - `LocationService`: Geolocation.
  - `RegionService`: Locale and timezone.
  - `ScreenShotService`: Screenshot capture.
- **Utils**: DeviceStatus enum.

## File Structure

```
lib/
  mago_device_manager.dart      # Export all public APIs
  src/
    models/                    # Data models
    services/                  # Service classes
    utils/                     # Utility enums/classes
```

## Dependencies

- `device_info_plus`
- `display_metrics`
- `geolocator`
- `flutter_timezone`
- `screenshot`
- and more (see pubspec.yaml)

## Testing

Unit tests are located in the `test/` directory. Run all tests with:

```sh
flutter test
```

## License

See [LICENSE](LICENSE).

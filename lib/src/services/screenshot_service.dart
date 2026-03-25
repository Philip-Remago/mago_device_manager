import 'dart:typed_data';

import 'package:screenshot/screenshot.dart';

class ScreenShotService {
  final ScreenshotController _controller = ScreenshotController();

  Future<Uint8List?> captureScreen() async {
    try {
      final Uint8List? image = await _controller.capture();
      return image;
    } catch (e) {
      return null;
    }
  }
}

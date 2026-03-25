import 'package:display_metrics/display_metrics.dart';
import 'package:flutter/material.dart';
import '../models/display_info.dart';

class DisplayService {
  const DisplayService();

  DisplayInfo? getDisplayInfo(BuildContext context) {
    final metrics = DisplayMetrics.maybeOf(context);
    if (metrics == null) return null;

    final mediaQuery = MediaQuery.of(context);
    final orientation = mediaQuery.orientation == Orientation.portrait
        ? 'portrait'
        : 'landscape';

    return DisplayInfo(
      widthPx: metrics.resolution.width,
      heightPx: metrics.resolution.height,
      pixelDensity: metrics.devicePixelRatio,
      orientation: orientation,
    );
  }

  Future<Map<String, dynamic>?> getDisplayInfoJson(BuildContext context) async {
    final info = getDisplayInfo(context);
    return info?.toJson();
  }
}

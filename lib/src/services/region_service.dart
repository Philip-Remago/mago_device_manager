import 'dart:ui' as ui;

import 'package:flutter_timezone/flutter_timezone.dart';
import '../models/region_info.dart';

class RegionService {
  Future<RegionInfo> getRegionInfo() async {
    final locale = ui.PlatformDispatcher.instance.locale;

    String? timeZone;
    try {
      final tzInfo = await FlutterTimezone.getLocalTimezone();
      timeZone = tzInfo.identifier;
    } catch (_) {
      timeZone = null;
    }

    return RegionInfo(
      locale: locale.toLanguageTag(),
      languageCode: locale.languageCode,
      countryCode: locale.countryCode,
      timeZone: timeZone,
    );
  }

  Future<Map<String, dynamic>> getRegionInfoJson() async {
    final regionInfo = await getRegionInfo();
    return regionInfo.toJson();
  }
}

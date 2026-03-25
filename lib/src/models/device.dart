import 'device_identity.dart';
import 'device_location.dart';
import '../utils/device_status.dart';
import 'display_info.dart';
import 'hardware_info.dart';
import 'operating_system_info.dart';
import 'region_info.dart';
import 'screenshot_info.dart';

class Device {
  final String id;
  final DeviceStatus status;
  final OperatingSystemInfo? os;
  final DeviceIdentity? identity;
  final HardwareInfo? hardware;
  final DisplayInfo? display;
  final DeviceLocation? location;
  final RegionInfo? region;
  final ScreenshotInfo? lastScreenshot;
  final bool? hasTouch;
  final DateTime? lastSeenAt;
  final DateTime? capturedAt;
  final List<String> tags;
  final double? uptimeHours;

  const Device({
    required this.id,
    this.status = DeviceStatus.offline,
    this.os,
    this.identity,
    this.hardware,
    this.display,
    this.location,
    this.region,
    this.lastScreenshot,
    this.hasTouch,
    this.lastSeenAt,
    this.capturedAt,
    this.tags = const [],
    this.uptimeHours,
  });

  Device copyWith({
    String? id,
    DeviceStatus? status,
    OperatingSystemInfo? os,
    DeviceIdentity? identity,
    HardwareInfo? hardware,
    DisplayInfo? display,
    DeviceLocation? location,
    RegionInfo? region,
    ScreenshotInfo? lastScreenshot,
    bool? hasTouch,
    DateTime? lastSeenAt,
    DateTime? capturedAt,
    List<String>? tags,
    double? uptimeHours,
  }) {
    return Device(
      id: id ?? this.id,
      status: status ?? this.status,
      os: os ?? this.os,
      identity: identity ?? this.identity,
      hardware: hardware ?? this.hardware,
      display: display ?? this.display,
      location: location ?? this.location,
      region: region ?? this.region,
      lastScreenshot: lastScreenshot ?? this.lastScreenshot,
      hasTouch: hasTouch ?? this.hasTouch,
      lastSeenAt: lastSeenAt ?? this.lastSeenAt,
      capturedAt: capturedAt ?? this.capturedAt,
      tags: tags ?? this.tags,
      uptimeHours: uptimeHours ?? this.uptimeHours,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'status': status.name,
    'os': os?.toJson(),
    'identity': identity?.toJson(),
    'hardware': hardware?.toJson(),
    'display': display?.toJson(),
    'location': location?.toJson(),
    'region': region?.toJson(),
    'lastScreenshot': lastScreenshot?.toJson(),
    'hasTouch': hasTouch,
    'lastSeenAt': lastSeenAt?.toIso8601String(),
    'capturedAt': capturedAt?.toIso8601String(),
    'tags': tags,
    'uptimeHours': uptimeHours,
  };

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      id: json['id'] as String,
      status: DeviceStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => DeviceStatus.offline,
      ),
      os: json['os'] != null
          ? OperatingSystemInfo.fromJson(Map<String, dynamic>.from(json['os']))
          : null,
      identity: json['identity'] != null
          ? DeviceIdentity.fromJson(Map<String, dynamic>.from(json['identity']))
          : null,
      hardware: json['hardware'] != null
          ? HardwareInfo.fromJson(Map<String, dynamic>.from(json['hardware']))
          : null,
      display: json['display'] != null
          ? DisplayInfo.fromJson(Map<String, dynamic>.from(json['display']))
          : null,
      location: json['location'] != null
          ? DeviceLocation.fromJson(Map<String, dynamic>.from(json['location']))
          : null,
      region: json['region'] != null
          ? RegionInfo.fromJson(Map<String, dynamic>.from(json['region']))
          : null,
      lastScreenshot: json['lastScreenshot'] != null
          ? ScreenshotInfo.fromJson(
              Map<String, dynamic>.from(json['lastScreenshot']),
            )
          : null,
      hasTouch: json['hasTouch'] as bool?,
      lastSeenAt: json['lastSeenAt'] != null
          ? DateTime.tryParse(json['lastSeenAt'] as String)
          : null,
      capturedAt: json['capturedAt'] != null
          ? DateTime.tryParse(json['capturedAt'] as String)
          : null,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e.toString()).toList() ??
          const [],
      uptimeHours: (json['uptimeHours'] as num?)?.toDouble(),
    );
  }
}

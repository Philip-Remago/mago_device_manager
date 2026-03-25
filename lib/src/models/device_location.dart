class DeviceLocation {
  final double? latitude;
  final double? longitude;
  final double? accuracyMeters;
  final double? altitudeMeters;
  final DateTime? timestamp;

  final String? building;
  final String? floor;
  final String? room;

  const DeviceLocation({
    this.latitude,
    this.longitude,
    this.accuracyMeters,
    this.altitudeMeters,
    this.timestamp,
    this.building,
    this.floor,
    this.room,
  });

  DeviceLocation copyWith({
    double? latitude,
    double? longitude,
    double? accuracyMeters,
    double? altitudeMeters,
    DateTime? timestamp,
    String? building,
    String? floor,
    String? room,
  }) {
    return DeviceLocation(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      accuracyMeters: accuracyMeters ?? this.accuracyMeters,
      altitudeMeters: altitudeMeters ?? this.altitudeMeters,
      timestamp: timestamp ?? this.timestamp,
      building: building ?? this.building,
      floor: floor ?? this.floor,
      room: room ?? this.room,
    );
  }

  Map<String, dynamic> toJson() => {
    'latitude': latitude,
    'longitude': longitude,
    'accuracyMeters': accuracyMeters,
    'altitudeMeters': altitudeMeters,
    'timestamp': timestamp?.toIso8601String(),
    'building': building,
    'floor': floor,
    'room': room,
  };

  factory DeviceLocation.fromJson(Map<String, dynamic> json) {
    return DeviceLocation(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      accuracyMeters: (json['accuracyMeters'] as num?)?.toDouble(),
      altitudeMeters: (json['altitudeMeters'] as num?)?.toDouble(),
      timestamp: json['timestamp'] != null
          ? DateTime.tryParse(json['timestamp'] as String)
          : null,
      building: json['building'] as String?,
      floor: json['floor'] as String?,
      room: json['room'] as String?,
    );
  }
}

class DeviceIdentity {
  final String? hardwareId;
  final String? brand;
  final String? model;
  final String? manufacturer;
  final String? deviceName;

  const DeviceIdentity({
    this.hardwareId,
    this.brand,
    this.model,
    this.manufacturer,
    this.deviceName,
  });

  DeviceIdentity copyWith({
    String? hardwareId,
    String? brand,
    String? model,
    String? manufacturer,
    String? deviceName,
  }) {
    return DeviceIdentity(
      hardwareId: hardwareId ?? this.hardwareId,
      brand: brand ?? this.brand,
      model: model ?? this.model,
      manufacturer: manufacturer ?? this.manufacturer,
      deviceName: deviceName ?? this.deviceName,
    );
  }

  Map<String, dynamic> toJson() => {
    'hardwareId': hardwareId,
    'brand': brand,
    'model': model,
    'manufacturer': manufacturer,
    'deviceName': deviceName,
  };

  factory DeviceIdentity.fromJson(Map<String, dynamic> json) {
    return DeviceIdentity(
      hardwareId: json['hardwareId'] as String?,
      brand: json['brand'] as String?,
      model: json['model'] as String?,
      manufacturer: json['manufacturer'] as String?,
      deviceName: json['deviceName'] as String?,
    );
  }
}

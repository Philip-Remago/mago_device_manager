class CameraInfo {
  final bool? available;
  final String? brand;
  final String? model;
  final bool? isInUse;

  const CameraInfo({this.available, this.brand, this.model, this.isInUse});

  CameraInfo copyWith({
    bool? available,
    String? brand,
    String? model,
    bool? isInUse,
  }) {
    return CameraInfo(
      available: available ?? this.available,
      brand: brand ?? this.brand,
      model: model ?? this.model,
      isInUse: isInUse ?? this.isInUse,
    );
  }

  Map<String, dynamic> toJson() => {
    'available': available,
    'brand': brand,
    'model': model,
    'isInUse': isInUse,
  };

  factory CameraInfo.fromJson(Map<String, dynamic> json) {
    return CameraInfo(
      available: json['available'] as bool?,
      brand: json['brand'] as String?,
      model: json['model'] as String?,
      isInUse: json['isInUse'] as bool?,
    );
  }
}

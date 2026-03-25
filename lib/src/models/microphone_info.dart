class MicrophoneInfo {
  final bool? available;
  final String? brand;
  final String? model;
  final bool? isInUse;

  const MicrophoneInfo({this.available, this.brand, this.model, this.isInUse});

  MicrophoneInfo copyWith({
    bool? available,
    String? brand,
    String? model,
    bool? isInUse,
  }) {
    return MicrophoneInfo(
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

  factory MicrophoneInfo.fromJson(Map<String, dynamic> json) {
    return MicrophoneInfo(
      available: json['available'] as bool?,
      brand: json['brand'] as String?,
      model: json['model'] as String?,
      isInUse: json['isInUse'] as bool?,
    );
  }
}

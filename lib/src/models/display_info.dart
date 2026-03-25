class DisplayInfo {
  final double? widthPx;
  final double? heightPx;
  final double? pixelDensity;
  final String? orientation;

  const DisplayInfo({
    this.widthPx,
    this.heightPx,
    this.pixelDensity,
    this.orientation,
  });

  DisplayInfo copyWith({
    double? widthPx,
    double? heightPx,
    double? pixelDensity,
    String? orientation,
  }) {
    return DisplayInfo(
      widthPx: widthPx ?? this.widthPx,
      heightPx: heightPx ?? this.heightPx,
      pixelDensity: pixelDensity ?? this.pixelDensity,
      orientation: orientation ?? this.orientation,
    );
  }

  Map<String, dynamic> toJson() => {
    'widthPx': widthPx,
    'heightPx': heightPx,
    'pixelDensity': pixelDensity,
    'orientation': orientation,
  };

  factory DisplayInfo.fromJson(Map<String, dynamic> json) {
    return DisplayInfo(
      widthPx: (json['widthPx'] as num?)?.toDouble(),
      heightPx: (json['heightPx'] as num?)?.toDouble(),
      pixelDensity: (json['pixelDensity'] as num?)?.toDouble(),
      orientation: json['orientation'] as String?,
    );
  }
}

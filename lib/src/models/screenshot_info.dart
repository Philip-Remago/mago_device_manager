class ScreenshotInfo {
  final String? path;
  final String? uri;
  final DateTime? capturedAt;

  const ScreenshotInfo({this.path, this.uri, this.capturedAt});

  ScreenshotInfo copyWith({String? path, String? uri, DateTime? capturedAt}) {
    return ScreenshotInfo(
      path: path ?? this.path,
      uri: uri ?? this.uri,
      capturedAt: capturedAt ?? this.capturedAt,
    );
  }

  Map<String, dynamic> toJson() => {
    'path': path,
    'uri': uri,
    'capturedAt': capturedAt?.toIso8601String(),
  };

  factory ScreenshotInfo.fromJson(Map<String, dynamic> json) {
    return ScreenshotInfo(
      path: json['path'] as String?,
      uri: json['uri'] as String?,
      capturedAt: json['capturedAt'] != null
          ? DateTime.tryParse(json['capturedAt'] as String)
          : null,
    );
  }
}

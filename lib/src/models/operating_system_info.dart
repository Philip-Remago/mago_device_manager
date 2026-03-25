class OperatingSystemInfo {
  final String? name;
  final String? version;
  final String? buildNumber;
  final String? userAgent;

  const OperatingSystemInfo({
    this.name,
    this.version,
    this.buildNumber,
    this.userAgent,
  });

  OperatingSystemInfo copyWith({
    String? name,
    String? version,
    String? buildNumber,
    String? kernelVersion,
    String? userAgent,
  }) {
    return OperatingSystemInfo(
      name: name ?? this.name,
      version: version ?? this.version,
      buildNumber: buildNumber ?? this.buildNumber,
      userAgent: userAgent ?? this.userAgent,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'version': version,
    'buildNumber': buildNumber,
    'userAgent': userAgent,
  };

  factory OperatingSystemInfo.fromJson(Map<String, dynamic> json) {
    return OperatingSystemInfo(
      name: json['name'] as String?,
      version: json['version'] as String?,
      buildNumber: json['buildNumber'] as String?,
      userAgent: json['userAgent'] as String?,
    );
  }
}

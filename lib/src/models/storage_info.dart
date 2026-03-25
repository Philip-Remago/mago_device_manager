class StorageInfo {
  final int? totalMb;
  final int? availableMb;
  final int? usedMb;
  final double? usagePercent;

  const StorageInfo({
    this.totalMb,
    this.availableMb,
    this.usedMb,
    this.usagePercent,
  });

  StorageInfo copyWith({
    int? totalMb,
    int? availableMb,
    int? usedMb,
    double? usagePercent,
  }) {
    return StorageInfo(
      totalMb: totalMb ?? this.totalMb,
      availableMb: availableMb ?? this.availableMb,
      usedMb: usedMb ?? this.usedMb,
      usagePercent: usagePercent ?? this.usagePercent,
    );
  }

  Map<String, dynamic> toJson() => {
    'totalMb': totalMb,
    'availableMb': availableMb,
    'usedMb': usedMb,
    'usagePercent': usagePercent,
  };

  factory StorageInfo.fromJson(Map<String, dynamic> json) {
    return StorageInfo(
      totalMb: json['totalMb'] as int?,
      availableMb: json['availableMb'] as int?,
      usedMb: json['usedMb'] as int?,
      usagePercent: (json['usagePercent'] as num?)?.toDouble(),
    );
  }
}

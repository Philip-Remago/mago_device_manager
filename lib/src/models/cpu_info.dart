class CpuInfo {
  final String? architecture;
  final String? model;
  final int? coreCount;
  final double? maxFrequencyGHz;
  final double? usagePercent;

  const CpuInfo({
    this.architecture,
    this.model,
    this.coreCount,
    this.maxFrequencyGHz,
    this.usagePercent,
  });

  CpuInfo copyWith({
    String? architecture,
    String? model,
    int? coreCount,
    double? maxFrequencyGHz,
    double? usagePercent,
  }) {
    return CpuInfo(
      architecture: architecture ?? this.architecture,
      model: model ?? this.model,
      coreCount: coreCount ?? this.coreCount,
      maxFrequencyGHz: maxFrequencyGHz ?? this.maxFrequencyGHz,
      usagePercent: usagePercent ?? this.usagePercent,
    );
  }

  Map<String, dynamic> toJson() => {
    'architecture': architecture,
    'model': model,
    'coreCount': coreCount,
    'maxFrequencyGHz': maxFrequencyGHz,
    'usagePercent': usagePercent,
  };

  factory CpuInfo.fromJson(Map<String, dynamic> json) {
    return CpuInfo(
      architecture: json['architecture'] as String?,
      model: json['model'] as String?,
      coreCount: json['coreCount'] as int?,
      maxFrequencyGHz: (json['maxFrequencyGHz'] as num?)?.toDouble(),
      usagePercent: (json['usagePercent'] as num?)?.toDouble(),
    );
  }
}

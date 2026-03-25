class RegionInfo {
  final String? locale;
  final String? languageCode;
  final String? countryCode;
  final String? timeZone;

  const RegionInfo({
    this.locale,
    this.languageCode,
    this.countryCode,
    this.timeZone,
  });

  RegionInfo copyWith({
    String? locale,
    String? languageCode,
    String? countryCode,
    String? timeZone,
  }) {
    return RegionInfo(
      locale: locale ?? this.locale,
      languageCode: languageCode ?? this.languageCode,
      countryCode: countryCode ?? this.countryCode,
      timeZone: timeZone ?? this.timeZone,
    );
  }

  Map<String, dynamic> toJson() => {
    'locale': locale,
    'languageCode': languageCode,
    'countryCode': countryCode,
    'timeZone': timeZone,
  };

  factory RegionInfo.fromJson(Map<String, dynamic> json) {
    return RegionInfo(
      locale: json['locale'] as String?,
      languageCode: json['languageCode'] as String?,
      countryCode: json['countryCode'] as String?,
      timeZone: json['timeZone'] as String?,
    );
  }
}

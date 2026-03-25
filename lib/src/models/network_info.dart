class DeviceNetworkInfo {
  final String? networkType;
  final double? downloadSpeedMbps;
  final double? uploadSpeedMbps;
  final String? connectionQuality;
  final String? recommendedVideoQuality;

  final String? wifiName;
  final String? wifiBssid;
  final String? wifiIp;
  final String? wifiIpv6;
  final String? wifiSubmask;
  final String? wifiBroadcast;
  final String? wifiGatewayIp;

  final DateTime? lastCheckedAt;

  const DeviceNetworkInfo({
    this.networkType,
    this.downloadSpeedMbps,
    this.uploadSpeedMbps,
    this.connectionQuality,
    this.recommendedVideoQuality,
    this.wifiName,
    this.wifiBssid,
    this.wifiIp,
    this.wifiIpv6,
    this.wifiSubmask,
    this.wifiBroadcast,
    this.wifiGatewayIp,
    this.lastCheckedAt,
  });

  DeviceNetworkInfo copyWith({
    String? networkType,
    double? downloadSpeedMbps,
    double? uploadSpeedMbps,
    String? connectionQuality,
    String? recommendedVideoQuality,
    String? wifiName,
    String? wifiBssid,
    String? wifiIp,
    String? wifiIpv6,
    String? wifiSubmask,
    String? wifiBroadcast,
    String? wifiGatewayIp,
    DateTime? lastCheckedAt,
  }) {
    return DeviceNetworkInfo(
      networkType: networkType ?? this.networkType,
      downloadSpeedMbps: downloadSpeedMbps ?? this.downloadSpeedMbps,
      uploadSpeedMbps: uploadSpeedMbps ?? this.uploadSpeedMbps,
      connectionQuality: connectionQuality ?? this.connectionQuality,
      recommendedVideoQuality:
          recommendedVideoQuality ?? this.recommendedVideoQuality,
      wifiName: wifiName ?? this.wifiName,
      wifiBssid: wifiBssid ?? this.wifiBssid,
      wifiIp: wifiIp ?? this.wifiIp,
      wifiIpv6: wifiIpv6 ?? this.wifiIpv6,
      wifiSubmask: wifiSubmask ?? this.wifiSubmask,
      wifiBroadcast: wifiBroadcast ?? this.wifiBroadcast,
      wifiGatewayIp: wifiGatewayIp ?? this.wifiGatewayIp,
      lastCheckedAt: lastCheckedAt ?? this.lastCheckedAt,
    );
  }

  Map<String, dynamic> toJson() => {
    'networkType': networkType,
    'downloadSpeedMbps': downloadSpeedMbps,
    'uploadSpeedMbps': uploadSpeedMbps,
    'connectionQuality': connectionQuality,
    'recommendedVideoQuality': recommendedVideoQuality,
    'wifiName': wifiName,
    'wifiBssid': wifiBssid,
    'wifiIp': wifiIp,
    'wifiIpv6': wifiIpv6,
    'wifiSubmask': wifiSubmask,
    'wifiBroadcast': wifiBroadcast,
    'wifiGatewayIp': wifiGatewayIp,
    'lastCheckedAt': lastCheckedAt?.toIso8601String(),
  };

  factory DeviceNetworkInfo.fromJson(Map<String, dynamic> json) {
    return DeviceNetworkInfo(
      networkType: json['networkType'] as String?,
      downloadSpeedMbps: (json['downloadSpeedMbps'] as num?)?.toDouble(),
      uploadSpeedMbps: (json['uploadSpeedMbps'] as num?)?.toDouble(),
      connectionQuality: json['connectionQuality'] as String?,
      recommendedVideoQuality: json['recommendedVideoQuality'] as String?,
      wifiName: json['wifiName'] as String?,
      wifiBssid: json['wifiBssid'] as String?,
      wifiIp: json['wifiIp'] as String?,
      wifiIpv6: json['wifiIpv6'] as String?,
      wifiSubmask: json['wifiSubmask'] as String?,
      wifiBroadcast: json['wifiBroadcast'] as String?,
      wifiGatewayIp: json['wifiGatewayIp'] as String?,
      lastCheckedAt: json['lastCheckedAt'] != null
          ? DateTime.tryParse(json['lastCheckedAt'] as String)
          : null,
    );
  }
}

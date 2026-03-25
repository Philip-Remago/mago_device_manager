import 'camera_info.dart';
import 'cpu_info.dart';
import 'microphone_info.dart';
import 'ram_info.dart';
import 'storage_info.dart';

class HardwareInfo {
  final RamInfo? ram;
  final CpuInfo? cpu;
  final StorageInfo? storage;
  final CameraInfo? camera;
  final MicrophoneInfo? microphone;

  const HardwareInfo({
    this.ram,
    this.cpu,
    this.storage,
    this.camera,
    this.microphone,
  });

  HardwareInfo copyWith({
    RamInfo? ram,
    CpuInfo? cpu,
    StorageInfo? storage,
    CameraInfo? camera,
    MicrophoneInfo? microphone,
  }) {
    return HardwareInfo(
      ram: ram ?? this.ram,
      cpu: cpu ?? this.cpu,
      storage: storage ?? this.storage,
      camera: camera ?? this.camera,
      microphone: microphone ?? this.microphone,
    );
  }

  Map<String, dynamic> toJson() => {
    'ram': ram?.toJson(),
    'cpu': cpu?.toJson(),
    'storage': storage?.toJson(),
    'camera': camera?.toJson(),
    'microphone': microphone?.toJson(),
  };

  factory HardwareInfo.fromJson(Map<String, dynamic> json) {
    return HardwareInfo(
      ram: json['ram'] != null
          ? RamInfo.fromJson(Map<String, dynamic>.from(json['ram']))
          : null,
      cpu: json['cpu'] != null
          ? CpuInfo.fromJson(Map<String, dynamic>.from(json['cpu']))
          : null,
      storage: json['storage'] != null
          ? StorageInfo.fromJson(Map<String, dynamic>.from(json['storage']))
          : null,
      camera: json['camera'] != null
          ? CameraInfo.fromJson(Map<String, dynamic>.from(json['camera']))
          : null,
      microphone: json['microphone'] != null
          ? MicrophoneInfo.fromJson(
              Map<String, dynamic>.from(json['microphone']),
            )
          : null,
    );
  }
}

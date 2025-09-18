import 'package:freezed_annotation/freezed_annotation.dart';

part 'ab_config.freezed.dart';
part 'ab_config.g.dart';

@freezed
class ABConfig with _$ABConfig {
  factory ABConfig({required List<String> domains}) = _ABConfig;

  factory ABConfig.fromJson(Map<String, dynamic> json) =>
      _$ABConfigFromJson(json);
}

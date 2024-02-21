import 'package:json_annotation/json_annotation.dart';

part 'planet_response.g.dart';

@JsonSerializable()
class PlanetResponse {
  PlanetResponse({
    required this.name,
    required this.rotationPeriod,
  });

  factory PlanetResponse.fromJson(Map<String, dynamic> json) =>
      _$PlanetResponseFromJson(json);

  final String name;

  @JsonKey(name: 'rotation_period')
  final String rotationPeriod;

  Map<String, dynamic> toJson() => _$PlanetResponseToJson(this);
}

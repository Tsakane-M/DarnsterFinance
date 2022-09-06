import 'package:json_annotation/json_annotation.dart';

part 'paged_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PagedResponse<T> {
  PagedResponse({
    required this.count,
    required this.results,
  });

  factory PagedResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$PagedResponseFromJson(json, fromJsonT);

  final int count;
  final List<T> results;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      _$PagedResponseToJson(this, toJsonT);
}

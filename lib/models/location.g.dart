// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) {
  return new Location(
      name: json['name'] as String,
      url: json['url'] as String,
      facts: (json['facts'] as List)
          ?.map((e) => e == null
              ? null
              : new LocationFact.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

abstract class _$LocationSerializerMixin {
  String get name;
  String get url;
  List<LocationFact> get facts;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'name': name, 'url': url, 'facts': facts};
}

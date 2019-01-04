// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) {
  return new Location(
      id: json['id'] as int,
      name: json['name'] as String,
      url: json['url'] as String,
      userItinerarySummary: json['userItinerarySummary'] as String,
      tourPackageName: json['tourPackageName'] as String,
      facts: (json['facts'] as List)
          ?.map((e) => e == null
              ? null
              : new LocationFact.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

abstract class _$LocationSerializerMixin {
  int get id;
  String get name;
  String get url;
  String get userItinerarySummary;
  String get tourPackageName;
  List<LocationFact> get facts;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'url': url,
        'userItinerarySummary': userItinerarySummary,
        'tourPackageName': tourPackageName,
        'facts': facts
      };
}

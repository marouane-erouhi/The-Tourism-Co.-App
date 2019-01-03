// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_fact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationFact _$LocationFactFromJson(Map<String, dynamic> json) {
  return new LocationFact(
      title: json['title'] as String, text: json['text'] as String);
}

abstract class _$LocationFactSerializerMixin {
  String get title;
  String get text;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'title': title, 'text': text};
}

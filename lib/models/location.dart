import 'package:json_annotation/json_annotation.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './location_fact.dart';
import '../endpoint.dart';

part './location.g.dart';

@JsonSerializable()
class Location{
  final int id;
  final String name;
  final String url;
  final List<LocationFact> facts;
  Location({this.id,this.name, this.url,this.facts});

  factory Location.fromJson(Map<String, dynamic> json) =>
    _$LocationFromJson(json);

  static Future<List<Location>> fetchAll() async {
    var uri = Endpoint.uri('/locations');

    final resp = await http.get(uri.toString());
    if(resp.statusCode != 200){
      throw(resp.body);
    }
    List<Location> list = new List<Location>();
    for(var locationData in json.decode(resp.body)){
      list.add(Location.fromJson(locationData));
    }
    return list;
  }

  static Future<Location> fetchById(int id) async {
    var uri = Endpoint.uri('/locations/$id');

    final resp = await http.get(uri.toString());
    if(resp.statusCode != 200){
      throw(resp.body);
    }

    final Map<String, dynamic> itemMap = json.decode(resp.body);
    return Location.fromJson(itemMap);
  }
}
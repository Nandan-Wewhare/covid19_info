import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

int state;
Future<Album> fetchAlbum(state) async {
  final response = await http.get('https://api.covid19india.org/data.json');

  if (response.statusCode == 200) {
    return Album.fromJson(json.decode(response.body), state);
  } else {
    throw Exception('Failed to load');
  }
}

class Album {
  final String deaths;
  final String recovered;
  final String active;
  final String confirmed;
  final String lastUpdated;
  Album({this.deaths, this.recovered, this.active, this.confirmed,this.lastUpdated});

  factory Album.fromJson(Map<String, dynamic> json, int state) {
    return Album(
      deaths: json['statewise'][state]['deaths'],
      recovered: json['statewise'][state]['recovered'],
      active: json['statewise'][state]['active'],
      confirmed: json['statewise'][state]['confirmed'],
      lastUpdated: json['statewise'][state]['lastupdatedtime']
    );
  }
}

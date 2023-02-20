import 'package:tv_maze_flutter/models/img.dart';
import 'package:tv_maze_flutter/models/links.dart';

class Episode {
  int? id;
  String? url;
  String? name;
  int? season;
  int? number;
  String? type;
  String? airdate;
  String? airtime;
  String? airstamp;
  int? runtime;
  Img? image;
  String? summary;
  Links? lLinks;

  Episode(
      {this.id,
      this.url,
      this.name,
      this.season,
      this.number,
      this.type,
      this.airdate,
      this.airtime,
      this.airstamp,
      this.runtime,
      this.image,
      this.summary,
      this.lLinks});

  Episode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    name = json['name'];
    season = json['season'];
    number = json['number'];
    type = json['type'];
    airdate = json['airdate'];
    airtime = json['airtime'];
    airstamp = json['airstamp'];
    runtime = json['runtime'];
    image = json['image'] != null ? new Img.fromJson(json['image']) : null;
    summary = json['summary'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['name'] = this.name;
    data['season'] = this.season;
    data['number'] = this.number;
    data['type'] = this.type;
    data['airdate'] = this.airdate;
    data['airtime'] = this.airtime;
    data['airstamp'] = this.airstamp;
    data['runtime'] = this.runtime;

    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['summary'] = this.summary;
    if (this.lLinks != null) {
      data['_links'] = this.lLinks!.toJson();
    }
    return data;
  }
}

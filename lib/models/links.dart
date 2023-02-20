import 'package:tv_maze_flutter/models/self.dart';

class Links {
  Self? self;
  Self? show;

  Links({this.self, this.show});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'] != null ? new Self.fromJson(json['self']) : null;
    show = json['show'] != null ? new Self.fromJson(json['show']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.self != null) {
      data['self'] = this.self!.toJson();
    }
    if (this.show != null) {
      data['show'] = this.show!.toJson();
    }
    return data;
  }
}

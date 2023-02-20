import 'package:flutter/material.dart';
import 'package:tv_maze_flutter/screens/episode/detail/episode_detail.dart';
import 'package:tv_maze_flutter/screens/shows/detail/show_detail.dart';
import 'package:tv_maze_flutter/screens/shows/list/shows_list.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/': (BuildContext context) => const ShowsList(),
  '/show': (BuildContext context) => const ShowsDetail(),
  '/episode': (BuildContext context) => const EpisodeDetail(),
};

import 'package:tv_maze_flutter/models/show.dart';
import 'package:tv_maze_flutter/services/web_client.dart';

class ShowsApiProvicer {
  WebClient webClient = WebClient();

  fetchShows(int page) async {
    final response = await webClient.get('/shows?page=$page');
    return (response?.data as List).map((e) => Show.fromJson(e)).toList();
  }

  fetchShow(int id) async {
    final response = await webClient.get('/shows/$id');
    return Show.fromJson(response?.data);
  }

  searchShows(String query) async {
    final response = await webClient.get('/search/shows?q=$query');
    return (response?.data as List)
        .map((e) => Show.fromJson(e['show']))
        .toList();
  }
}

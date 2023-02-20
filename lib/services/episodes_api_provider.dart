import 'package:tv_maze_flutter/models/episode.dart';
import 'package:tv_maze_flutter/services/web_client.dart';

class EpisodesApiProvicer {
  WebClient webClient = WebClient();

  fetchEpisodes(int showId) async {
    final response = await webClient.get('/shows/$showId/episodes');
    return (response?.data as List).map((e) => Episode.fromJson(e)).toList();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:tv_maze_flutter/models/episode.dart';

class EpisodeDetail extends StatelessWidget {
  const EpisodeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final episode = ModalRoute.of(context)!.settings.arguments as Episode;
    return Scaffold(
      appBar: AppBar(
        title: Text(episode.name!),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Image
            Image.network(
              episode.image?.medium ?? "",
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            //Name
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(episode.name!,
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            //Season and number
            Text("Season ${episode.season} - Episode ${episode.number}",
                style: Theme.of(context).textTheme.titleMedium),
            //Summary
            Html(data: episode.summary!),
          ],
        ),
      ),
    );
  }
}

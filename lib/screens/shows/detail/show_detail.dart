import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:tv_maze_flutter/models/show.dart';
import 'package:tv_maze_flutter/screens/shows/widgets/episodes/episodes.dart';

class ShowsDetail extends StatelessWidget {
  const ShowsDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final show = ModalRoute.of(context)!.settings.arguments as Show;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 450,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(show.name!),
              background: Image.network(
                show.image!.original!,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                //Days and time during which the series airs
                if (show.schedule!.days!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Days: ${show.schedule!.days!.join(', ')}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                //Genres
                if (show.genres!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Genres: ${show.genres!.join(', ')}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                //Summary
                if (show.summary != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Html(
                      data: show.summary!,
                      style: {
                        "body": Style(
                          fontSize: FontSize(16.0),
                        ),
                      },
                    ),
                  ),
              ],
            ),
          ),
          Episodes(
            showId: show.id!,
          )
        ],
      ),
    );
  }
}

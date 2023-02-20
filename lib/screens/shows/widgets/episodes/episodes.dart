import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_maze_flutter/screens/shows/widgets/episodes/bloc/episodes_bloc.dart';

class Episodes extends StatelessWidget {
  final int showId;
  const Episodes({super.key, required this.showId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EpisodesBloc, EpisodesState>(
      bloc: BlocProvider.of<EpisodesBloc>(context)
        ..add(EpisodesEventLoad(showId)),
      builder: (context, state) {
        if (state is EpisodesInitial) {
          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is EpisodesLoaded) {
          var data = groupBy(state.episodes, (obj) => obj.season!);
          return SliverList(
            delegate: SliverChildListDelegate(
              [
                for (var season in data.keys)
                  ExpansionTile(
                    title: Text("Season $season",
                        style: Theme.of(context).textTheme.titleMedium),
                    children: [
                      for (var episode in data[season]!)
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/episode',
                              arguments: episode,
                            );
                          },
                          child: ListTile(
                            title: Text(
                              episode.name!,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                    ],
                  ),
              ],
            ),
          );
        }
        if (state is EpisodesError) {
          return SliverFillRemaining(
            child: Center(
              child: Text(state.message),
            ),
          );
        }
        return const SliverFillRemaining(
          child: Center(
            child: Text('Episodes'),
          ),
        );
      },
    );
  }
}

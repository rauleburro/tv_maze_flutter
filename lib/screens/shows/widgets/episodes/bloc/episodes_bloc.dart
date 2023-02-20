import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_maze_flutter/models/episode.dart';
import 'package:tv_maze_flutter/services/episodes_api_provider.dart';

part 'episodes_event.dart';
part 'episodes_state.dart';

class EpisodesBloc extends Bloc<EpisodesEvent, EpisodesState> {
  final EpisodesApiProvicer _episodesApiProvicer = EpisodesApiProvicer();
  EpisodesBloc() : super(EpisodesInitial()) {
    on<EpisodesEventLoad>((event, emit) async {
      try {
        emit(EpisodesInitial());
        final episodes = await _episodesApiProvicer.fetchEpisodes(event.showId);
        emit(EpisodesLoaded(episodes));
      } catch (e) {
        emit(EpisodesError(e.toString()));
      }
    });
  }
}

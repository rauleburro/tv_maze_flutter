part of 'episodes_bloc.dart';

@immutable
abstract class EpisodesState {}

class EpisodesInitial extends EpisodesState {}

class EpisodesLoaded extends EpisodesState {
  final List<Episode> episodes;

  EpisodesLoaded(this.episodes);
}

class EpisodesError extends EpisodesState {
  final String message;

  EpisodesError(this.message);
}

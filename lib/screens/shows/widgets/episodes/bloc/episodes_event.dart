part of 'episodes_bloc.dart';

@immutable
abstract class EpisodesEvent {}

class EpisodesEventLoad extends EpisodesEvent {
  final int showId;

  EpisodesEventLoad(this.showId);
}

part of 'shows_detail_bloc.dart';

@immutable
abstract class ShowsDetailEvent {}

class ShowsDetailEventLoad extends ShowsDetailEvent {
  final int showId;

  ShowsDetailEventLoad(this.showId);
}

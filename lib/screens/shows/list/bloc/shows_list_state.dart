part of 'shows_list_bloc.dart';

@immutable
abstract class ShowsListState {}

class ShowsListInitial extends ShowsListState {}

class ShowsListLoaded extends ShowsListState {
  final List<Show> shows;
  final int page;

  ShowsListLoaded(this.shows, this.page);
}

class ShowsListError extends ShowsListState {
  final String message;

  ShowsListError(this.message);
}

part of 'shows_list_bloc.dart';

@immutable
abstract class ShowsListEvent {}

class ShowsListEventLoad extends ShowsListEvent {}

class ShowsListEventLoadMore extends ShowsListEvent {}

class ShowsListEventSearch extends ShowsListEvent {
  final String query;

  ShowsListEventSearch(this.query);
}

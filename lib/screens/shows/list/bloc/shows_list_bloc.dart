import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_maze_flutter/models/show.dart';
import 'package:tv_maze_flutter/services/shows_api_provider.dart';

part 'shows_list_event.dart';
part 'shows_list_state.dart';

class ShowsListBloc extends Bloc<ShowsListEvent, ShowsListState> {
  final ShowsApiProvicer _showsApiProvicer = ShowsApiProvicer();

  ShowsListBloc() : super(ShowsListInitial()) {
    on<ShowsListEventLoad>((event, emit) async {
      try {
        emit(ShowsListInitial());
        List<Show> shows = await _showsApiProvicer.fetchShows(0);
        emit(ShowsListLoaded(shows, 0));
      } catch (e) {
        emit(ShowsListError(e.toString()));
      }
    });
    on<ShowsListEventSearch>((event, emit) async {
      try {
        emit(ShowsListInitial());
        List<Show> shows = [];
        if (event.query.isNotEmpty) {
          shows = await _showsApiProvicer.searchShows(event.query);
        } else {
          shows = await _showsApiProvicer.fetchShows(1);
        }
        emit(ShowsListLoaded(shows, 0));
      } catch (e) {
        emit(ShowsListError(e.toString()));
      }
    });
    on<ShowsListEventLoadMore>((event, emit) async {
      try {
        if (state is ShowsListLoaded) {
          final ShowsListLoaded loadedState = state as ShowsListLoaded;
          List<Show> shows =
              await _showsApiProvicer.fetchShows(loadedState.page + 1);

          emit(ShowsListLoaded(
              List.of(loadedState.shows)..addAll(shows), loadedState.page + 1));
        }
      } catch (e) {
        emit(ShowsListError(e.toString()));
      }
    });
  }
}

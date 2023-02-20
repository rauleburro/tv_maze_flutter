import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_maze_flutter/models/show.dart';
import 'package:tv_maze_flutter/services/shows_api_provider.dart';

part 'shows_detail_event.dart';
part 'shows_detail_state.dart';

class ShowsDetailBloc extends Bloc<ShowsDetailEvent, ShowsDetailState> {
  ShowsApiProvicer _showsApiProvicer = ShowsApiProvicer();

  ShowsDetailBloc() : super(ShowsDetailInitial()) {
    on<ShowsDetailEventLoad>((event, emit) async {
      try {
        emit(ShowsDetailLoading());
        var show = await _showsApiProvicer.fetchShow(event.showId);
        emit(ShowsDetailLoaded(show));
      } catch (e) {
        emit(ShowsDetailError(e.toString()));
      }
    });
  }
}

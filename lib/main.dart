import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_maze_flutter/app.dart';
import 'package:tv_maze_flutter/screens/shows/detail/bloc/shows_detail_bloc.dart';
import 'package:tv_maze_flutter/screens/shows/list/bloc/shows_list_bloc.dart';
import 'package:tv_maze_flutter/screens/shows/widgets/episodes/bloc/episodes_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ShowsListBloc>(
        create: (context) => ShowsListBloc()..add(ShowsListEventLoad()),
      ),
      BlocProvider(
        create: (context) => ShowsDetailBloc(),
      ),
      BlocProvider(
        create: (context) => EpisodesBloc(),
      ),
    ],
    child: const App(),
  ));
}

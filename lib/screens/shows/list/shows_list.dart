import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_maze_flutter/screens/shows/list/bloc/shows_list_bloc.dart';

class ShowsList extends StatefulWidget {
  const ShowsList({super.key});

  @override
  State<ShowsList> createState() => _ShowsListState();
}

class _ShowsListState extends State<ShowsList> {
  final _scrollController = ScrollController(keepScrollOffset: true);
  bool showFloatingButton = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  _onScroll() {
    if (_scrollController.offset > 0) {
      setState(() {
        showFloatingButton = true;
      });
    } else {
      setState(() {
        showFloatingButton = false;
      });
    }
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      context.read<ShowsListBloc>().add(ShowsListEventLoadMore());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shows'),
      ),
      floatingActionButton: showFloatingButton
          ? FloatingActionButton(
              onPressed: () {
                _scrollController.animateTo(0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              },
              child: const Icon(Icons.arrow_upward),
            )
          : null,
      body: Column(
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.search),
              title: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                ),
                onSubmitted: (value) {
                  context
                      .read<ShowsListBloc>()
                      .add(ShowsListEventSearch(value));
                },
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<ShowsListBloc, ShowsListState>(
              builder: (context, state) {
                if (state is ShowsListInitial) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ShowsListLoaded) {
                  return GridView.builder(
                    controller: _scrollController,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 2 / 3.2,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                    ),
                    itemCount: state.shows.length + 1,
                    itemBuilder: (context, index) {
                      if (index == state.shows.length) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final show = state.shows[index];
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/show',
                              arguments: show);
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Image.network(
                                show.image?.medium ?? "",
                              ),
                              Expanded(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      show.name! == "" ? "No name" : show.name!,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                if (state is ShowsListError) {
                  return Center(
                    child: Text(state.message),
                  );
                }
                return const Center(
                  child: Text('Shows List'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

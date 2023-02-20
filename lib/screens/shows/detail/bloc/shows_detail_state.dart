part of 'shows_detail_bloc.dart';

@immutable
abstract class ShowsDetailState {}

class ShowsDetailInitial extends ShowsDetailState {}

class ShowsDetailLoading extends ShowsDetailState {}

class ShowsDetailLoaded extends ShowsDetailState {
  final Show show;

  ShowsDetailLoaded(this.show);
}

class ShowsDetailError extends ShowsDetailState {
  final String message;

  ShowsDetailError(this.message);
}

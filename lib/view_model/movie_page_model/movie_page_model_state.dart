part of 'movie_page_model_cubit.dart';

@immutable
abstract class MoviePageModelState {}

class MoviePageModelInitial extends MoviePageModelState {}

class MoviePageModelSuccess extends MoviePageModelState {}
class MoviePageModelError extends MoviePageModelState {
  String err;
  MoviePageModelError(this.err);
}
class MoviePageModelWait extends MoviePageModelState {}

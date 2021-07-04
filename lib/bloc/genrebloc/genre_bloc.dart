import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_trainning/apis/apis.dart';
import 'package:flutter_trainning/bloc/genrebloc/genre_event.dart';
import 'package:flutter_trainning/bloc/genrebloc/genre_state.dart';
import 'package:flutter_trainning/model/genre.dart';


class GenreBloc extends Bloc<GenreEvent, GenreState> {
  GenreBloc() : super(GenreLoading());

  @override
  Stream<GenreState> mapEventToState(GenreEvent event) async* {
    if (event is GenreEventStarted) {
      yield* _mapMovieEventStateToState();
    }
  }

  Stream<GenreState> _mapMovieEventStateToState() async* {
    final service = ApiService();
    yield GenreLoading();
    try {
      List<Genre> genreList = await service.getGenreList();

      yield GenreLoaded(genreList);
    } on Exception catch (e) {
      print(e);
      yield GenreError();
    }
  }
}

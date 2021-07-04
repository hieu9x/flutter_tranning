import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_trainning/apis/apis.dart';
import 'package:flutter_trainning/bloc/search/search_event.dart';
import 'package:flutter_trainning/bloc/search/search_state.dart';
import 'package:flutter_trainning/model/movie.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchLoading());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchEventStarted) {
      yield* _mapSearchEventStateToState(event.query);
    }
  }

  Stream<SearchState> _mapSearchEventStateToState(
       String query) async* {
    final service = ApiService();
    yield SearchLoading();
    try {
      List<Movie> searchList;
      if (query.isNotEmpty) {
        searchList = await service.getSearch(query);
      }
      yield SearchLoaded(searchList);
    } on Exception catch (e) {
      print(e);
      yield SearchError();
    }
  }
}

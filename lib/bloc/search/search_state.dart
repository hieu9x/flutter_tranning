import 'package:equatable/equatable.dart';
import 'package:flutter_trainning/model/movie.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<Movie> SearchList;
  const SearchLoaded(this.SearchList);

  @override
  List<Object> get props => [SearchList];
}

class SearchError extends SearchState {}

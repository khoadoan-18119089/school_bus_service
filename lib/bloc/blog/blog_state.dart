part of 'blog_bloc.dart';

abstract class BlogState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BlogInitial extends BlogState {}

class BlogloadingState extends BlogState {}

class BlogLoadedState extends BlogState {
  final List<Map<String, Object?>?> data;

  BlogLoadedState(this.data);

  @override
  List<Object?> get props => [data];

  List<BlogModel> get models => data.map((e) => BlogModel(e)).toList();
}

class BlogErrorState extends BlogState {
  final String error;

  BlogErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  BlogBloc() : super(BlogInitial()) {
    on<LoadBlogEvent>((event, emit) async {
      emit(BlogloadingState());
      try {
        List<Map<String, Object?>?> data = await _repository();
        emit(BlogLoadedState(data));
      } catch (error) {
        emit(BlogErrorState(error.toString()));
      }
    });
  }

  Future<List<Map<String, Object?>?>> _repository() async {
    await Future.delayed(const Duration(seconds: 5));
    return [];
  }
}

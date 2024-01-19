import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pagination_flutter/pagination/domain/usecase/get_all_comments_usecase.dart';
import 'package:pagination_flutter/pagination/presentation/state/comment_state.dart';

final commentViewModelProvider =
    StateNotifierProvider<CommentViewModel, CommentState>((ref) {
  final getCommentUsecase = ref.read(getCommentUsecaseProvider);
  return CommentViewModel(getCommentUsecase);
});

class CommentViewModel extends StateNotifier<CommentState> {
  final GetComentsUsecase _getComentsUsecase;
  CommentViewModel(
    this._getComentsUsecase,
  ) : super(
          CommentState.initial(),
        ) {
    getComments();
  }

  Future resetState() async {
    state = CommentState.initial();
    getComments();
  }

  Future getComments() async {
    state = state.copyWith(isLoading: true);
    final currentState = state;
    final page = currentState.page + 1;
    final comments = currentState.comments;
    final hasReachedMax = currentState.hasReachedMax;
    if (!hasReachedMax) {
      //* get data from data source
      final result = await _getComentsUsecase.getComments(page);
      result.fold(
        (failure) =>
            state = state.copyWith(hasReachedMax: true, isLoading: false),
        (data) {
          if (data.isEmpty) {
            state = state.copyWith(hasReachedMax: true);
          } else {
            state = state.copyWith(
              comments: [...comments, ...data],
              page: page,
              isLoading: false,
            );
          }
        },
      );
    }
  }
}

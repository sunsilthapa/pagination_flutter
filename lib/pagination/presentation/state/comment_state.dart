import 'package:pagination_flutter/pagination/data/model/comments.dart';

class CommentState {
  final List<Comments> comments;
  final bool hasReachedMax;
  final int page;
  final bool isLoading;

  CommentState({
    required this.comments,
    required this.hasReachedMax,
    required this.page,
    required this.isLoading,
  });

  factory CommentState.initial() {
    return CommentState(
      comments: [],
      hasReachedMax: false,
      page: 0,
      isLoading: false,
    );
  }

  CommentState copyWith({
    List<Comments>? comments,
    bool? hasReachedMax,
    int? page,
    bool? isLoading,
  }) {
    return CommentState(
      comments: comments ?? this.comments,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

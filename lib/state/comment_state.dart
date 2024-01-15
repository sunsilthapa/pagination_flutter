import 'package:pagination_flutter/model/comments.dart';

class CommentState {
  final List<Comments> comments;
  final bool hasReachedMax;
  final int page;

  CommentState({
    required this.comments,
    required this.hasReachedMax,
    required this.page,
  });

  factory CommentState.initial() {
    return CommentState(
      comments: [],
      hasReachedMax: false,
      page: 0,
    );
  }

  CommentState copyWith({
    List<Comments>? comments,
    bool? hasReachedMax,
    int? page,
  }) {
    return CommentState(
      comments: comments ?? this.comments,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }
}

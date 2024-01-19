import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pagination_flutter/core/failure/failure.dart';
import 'package:pagination_flutter/pagination/data/model/comments.dart';
import 'package:pagination_flutter/pagination/data/repository/comment_repo_impl.dart';

final commentRepositoryProvider = Provider.autoDispose<CommentRepository>(
    (ref) => ref.read(commentRepoImplProvider));

abstract class CommentRepository {
  Future<Either<Failure, List<Comments>>> getComments(int page);
}

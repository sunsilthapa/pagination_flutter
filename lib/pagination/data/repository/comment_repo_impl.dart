


import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pagination_flutter/core/failure/failure.dart';
import 'package:pagination_flutter/pagination/data/data_source/comments_data_source.dart';
import 'package:pagination_flutter/pagination/data/model/comments.dart';
import 'package:pagination_flutter/pagination/domain/repository/comment_repository.dart';

final commentRepoImplProvider = Provider.autoDispose<CommentRepositoryImpl>((ref) => CommentRepositoryImpl(commentDataSource: ref.read(commentDataSourceProvider)));
class CommentRepositoryImpl implements CommentRepository{

  final CommentDataSource commentDataSource;

  CommentRepositoryImpl({required this.commentDataSource});
  @override
  Future<Either<Failure, List<Comments>>> getComments(int page) {
    // TODO: implement getComments
    return commentDataSource.getPosts(page);
  }

}



import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pagination_flutter/pagination/domain/repository/comment_repository.dart';


final getCommentUsecaseProvider = Provider.autoDispose<GetComentsUsecase>((ref) => GetComentsUsecase(commentRepository: ref.read(commentRepositoryProvider)));
class GetComentsUsecase{
  final CommentRepository commentRepository;

  GetComentsUsecase({required this.commentRepository});

  Future getComments(int page){
    return commentRepository.getComments(page);
  }


}
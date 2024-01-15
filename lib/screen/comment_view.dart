import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pagination_flutter/view_model/comments_view_models.dart';

class CommentView extends ConsumerWidget {
  const CommentView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(commentViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagination Flutter'),
      ),
      body:
          // Display data in listview using a scroll controller
          ListView.builder(
        itemCount: state.comments.length,
        itemBuilder: (context, index) {
          final comment = state.comments[index];
          return ListTile(
            leading: Text(comment.id.toString()),
            title: Text(comment.name),
            subtitle: Text(comment.email),
          );
        },
      ),
    );
  }
}

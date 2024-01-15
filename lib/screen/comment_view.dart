import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pagination_flutter/view_model/comments_view_models.dart';

class CommentView extends ConsumerStatefulWidget {
  const CommentView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CommentViewState();
}

class _CommentViewState extends ConsumerState<CommentView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(commentViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagination Flutter'),
        actions: [
          TextButton.icon(
            onPressed: () {
              ref.read(commentViewModelProvider.notifier).resetState();
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Refresh'),
          ),
        ],
      ),
      body: NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollEndNotification) {
            // Scroll garda feri last ma ho ki haina bhanera check garne ani data call garne
            if (_scrollController.position.extentAfter == 0) {
              // Data fetch gara api bata
              ref.read(commentViewModelProvider.notifier).getComments();
            }
          }
          return true;
        },
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                controller: _scrollController,
                itemCount: state.comments.length,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final comment = state.comments[index];
                  return ListTile(
                    leading: Text(comment.id.toString()),
                    title: Text(comment.name),
                    subtitle: Text(comment.email),
                  );
                },
              ),
            ),
            // Data load huda feri progress bar dekhaune natra banda garne
            if (state.isLoading)
              const CircularProgressIndicator(color: Colors.red),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

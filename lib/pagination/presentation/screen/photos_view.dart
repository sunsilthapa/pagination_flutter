import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pagination_flutter/pagination/presentation/view_model/phots_viewmodel.dart';

class PhotoView extends ConsumerStatefulWidget {
  const PhotoView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PhotoViewState();
}

class _PhotoViewState extends ConsumerState<PhotoView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(photosViewModelProvider);
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        backgroundColor: Colors.yellow[400],
        title: const Text('Pagination Flutter'),
        actions: [
          TextButton.icon(
            onPressed: () {
              ref.read(photosViewModelProvider.notifier).resetState();
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Refresh'),
          ),
        ],
      ),
      body: NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollEndNotification) {
            //* Scroll garda feri last ma ho ki haina bhanera check garne ani data call garne
            if (_scrollController.position.extentAfter == 0) {
              //* Data fetch gara api bata
              ref.read(photosViewModelProvider.notifier).getPhotos();
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
                itemCount: state.photos.length,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final photo = state.photos[index];
                  return Card(
                    child: Image.network(photo.url),
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

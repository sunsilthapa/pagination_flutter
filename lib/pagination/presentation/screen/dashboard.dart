import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pagination_flutter/pagination/presentation/screen/comment_view.dart';
import 'package:pagination_flutter/pagination/presentation/screen/photos_view.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Pagination",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const CommentView()),
              );
            },
            child: const SizedBox(
              width: 200,
              height: 200,
              child: Card(
                child: Icon(
                  Icons.comment,
                  size: 60,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const PhotoView()),
              );
            },
            child: const SizedBox(
              width: 200,
              height: 200,
              child: Card(
                child: Icon(
                  Icons.photo,
                  size: 60,
                  color: Colors.orange,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

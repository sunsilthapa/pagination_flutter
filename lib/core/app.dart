import 'package:flutter/material.dart';
import 'package:pagination_flutter/pagination/presentation/screen/dashboard.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pagination Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DashboardView(),
    );
  }
}

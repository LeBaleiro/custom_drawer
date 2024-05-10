import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(
        items: [
          (icon: Icon(Icons.email), title: 'Inbox'),
          (icon: Icon(Icons.send), title: 'New'),
          (icon: Icon(Icons.error_outline), title: 'Spam'),
          (icon: Icon(Icons.delete), title: 'Bin'),
          (icon: Icon(Icons.drafts), title: 'Drafts'),
          (icon: Icon(Icons.archive), title: 'Archive'),
        ],
      ),
    );
  }
}

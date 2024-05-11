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
          (icon: Icon(Icons.email), title: Text('Inbox')),
          (icon: Icon(Icons.send), title: Text('New')),
          (icon: Icon(Icons.error_outline), title: Text('Spam')),
          (icon: Icon(Icons.delete), title: Text('Bin')),
          (icon: Icon(Icons.drafts), title: Text('Drafts')),
          (icon: Icon(Icons.archive), title: Text('Archive')),
        ],
      ),
    );
  }
}

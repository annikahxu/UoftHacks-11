// lib/pages/second_page.dart

import 'package:flutter/material.dart';

class Swipe extends StatelessWidget {
  // Add a named 'key' parameter to the constructor
  const Swipe ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: const Center(
        child: Text('This is the Second Page'),
      ),
    );
  }
}

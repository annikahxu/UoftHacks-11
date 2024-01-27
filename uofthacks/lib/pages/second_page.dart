// lib/pages/second_page.dart

import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  // Add a named 'key' parameter to the constructor
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: const Center(
        child: Text('This is the Second Page'),
      ),
    );
  }
}

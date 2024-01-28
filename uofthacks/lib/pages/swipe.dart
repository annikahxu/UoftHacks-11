// lib/pages/second_page.dart

import 'package:flutter/material.dart';
import 'package:uofthacks/main.dart';

class Swipe extends StatelessWidget {
  final FocusNode inputNode = FocusNode();

  Swipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.zero,
          child: SizedBox(
            height: 200,
            width: 300,
            child: Column (
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextField(
                  autofocus: true,
                  focusNode: inputNode,
                  onTap: () {
                    // Request focus when tapped
                    FocusScope.of(context).requestFocus(inputNode);
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 40,
                      horizontal: 8,
                    ),
                    hintText: 'Say something...',
                    hintStyle: const TextStyle(color: Colors.black),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 12),
                Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyHomePage()),
                      );
              }, 
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 52, vertical: 8),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {
                      // Handle save button press
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 52, vertical: 8),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    child: const Text('Save'),
                  ),
                ],
              ),
              ]
            )
          ) 
          )
          ),
        );
  }
}
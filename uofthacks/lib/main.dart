import 'package:flutter/material.dart';
import 'package:uofthacks/pages/map_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage ({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
  final PageController _pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        child: GestureDetector(
          
          child: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          pageSnapping: true, // Enable snapping effect
          itemBuilder: (context, index) {
              if (index == 0) {
                return GestureDetector(
                onHorizontalDragUpdate: (details) {
                  int xPosition = details.globalPosition.dx.toInt();
                  double screenWidth = MediaQuery.of(context).size.width;
                  double rightEdgeThreshold = screenWidth - 100.0;

                  if (xPosition > rightEdgeThreshold) {
                    _pageController.jumpToPage(index + 1);
                  }
                },
                child: const Swipe(),
              );

              } else if (index == 1) {
                  return GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      int xPosition = details.globalPosition.dx.toInt();
                      double screenWidth = MediaQuery.of(context).size.width;
                      double leftEdgeThreshold = 100.0;
                      double rightEdgeThreshold = screenWidth - 100.0;

                      if (xPosition < leftEdgeThreshold) {
                        _pageController.jumpToPage(index - 1);
                      } else if (xPosition > rightEdgeThreshold) {
                        _pageController.jumpToPage(index+1);
                      }
                    },
                    child: const LandingPage(),
                  );
              } else if (index == 2) {
                  return GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      int xPosition = details.globalPosition.dx.toInt();
                      double leftEdgeThreshold = 100.0;

                      if (xPosition < leftEdgeThreshold) {
                        _pageController.jumpToPage(index - 1);
                      }
                    },
                    child: const MapPage(),
              );
              }
              return null;
            },
            ),
        )
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        decoration: const BoxDecoration(
          image:DecorationImage(
            image: AssetImage('assets/landingpage.jpeg'),
            fit: BoxFit.cover
          ),
        ),
      ),
    );
  }
}

class Swipe extends StatelessWidget {
  const Swipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Center(
        child: Text('Swipe Page'),
      ),
    );
  }
}

class LeftSwipe extends StatelessWidget {
  const LeftSwipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Center(
        child: Text('Left Swipe Page'),
      ),
    );
  }
}

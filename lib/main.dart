import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SnakeNavigationDemo(),
    );
  }
}

class SnakeNavigationDemo extends StatefulWidget {
  @override
  _SnakeNavigationDemoState createState() => _SnakeNavigationDemoState();
}

class _SnakeNavigationDemoState extends State<SnakeNavigationDemo> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snake Navigation Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                // Add your pages here
                Container(
                  color: Colors.blue,
                  child: Center(
                    child: Text('Page 1'),
                  ),
                ),
                Container(
                  color: Colors.green,
                  child: Center(
                    child: Text('Page 2'),
                  ),
                ),
                Container(
                  color: Colors.orange,
                  child: Center(
                    child: Text('Page 3'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          _buildPageIndicator(),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              if (_currentPage < 2) {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              }
            },
            child: Text('Next'),
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3, // Number of pages
            (index) => Container(
          width: 10.0,
          height: 10.0,
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index ? Colors.blue : Colors.grey,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/bottom_navbar.dart';
import 'home_screen.dart';

class DownloadsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HomeScreen()),
                  (route) => false,
            );
          },
        ),
        title: Text('Downloads'),
      ),
      body: Center(child: Text('Downloads Screen')),
      bottomNavigationBar: BottomNavBar(currentIndex: 2),
    );
  }
}

//Dummy Download section

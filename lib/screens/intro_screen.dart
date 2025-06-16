import 'package:flutter/material.dart';
import 'package:mindful_app2/screens/settings_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/sea.jpg',
              fit: BoxFit.cover,
              )),
          const Align(
              alignment: Alignment(0, -0.5),
              child: Text('Welcome', 
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  shadows: [Shadow(
                    color: Colors.black,
                    blurRadius: 10,
                    offset: Offset(5, 5)
                  )]
                  ),
              )
          ),
          Align(
            alignment: Alignment(0, 0.5),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const SettingsScreen();
                    })
                );
              },
              child: Text('Start')),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'dart:async';
import 'package:ticket_hub/screens/home/home.dart';

import '../on_boarding/on_boarding.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with TickerProviderStateMixin {

  late GifController _controller;

  @override
  void initState() {
    super.initState();
    _controller = GifController(vsync: this);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
        _controller.forward();
      }
    });

    Timer(Duration(seconds: 7), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/light_background.png"), // Background image
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gif(
                image: AssetImage("assets/images/animation.gif"),
                controller: _controller,
                autostart: Autostart.once,
                placeholder: (context) => const Text('Loading...'),
                  onFetchCompleted: () {
                    _controller.reset();
                    _controller.forward();
                  },
              ),
              SizedBox(height: 16),
              Text(
                'Loading...',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

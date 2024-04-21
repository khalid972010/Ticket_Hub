import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      'title': 'Welcome to Flutter Onboarding',
      'description': 'This is a simple onboarding screen built with Flutter.',
      'image': 'assets/images/vector3.png',
    },
    {
      'title': 'Beautiful UI',
      'description': 'Flutter allows you to create stunning user interfaces.',
      'image': 'assets/images/vector5.png',
    },
    {
      'title': 'Cross-platform',
      'description':
          'Write code once, deploy on both iOS and Android platforms.',
      'image': 'assets/images/vector6.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/dark_background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _onboardingData.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return OnboardingPage(
                title: _onboardingData[index]['title']!,
                description: _onboardingData[index]['description']!,
                image: _onboardingData[index]['image']!,
              );
            },
          ),
          Positioned(
            bottom: 40.0,
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(),
            ),
          ),
          Positioned(
            bottom: 24.0,
            right: 16.0,
            child: Visibility(
              visible: _currentPage == _onboardingData.length - 1,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the next screen or perform any desired action
                },
                child: const Text('Get Started'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < _onboardingData.length; i++) {
      indicators.add(
        i == _currentPage ? _indicator(true) : _indicator(false),
      );
    }
    return indicators;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      height: 8.0,
      width: isActive ? 24.0 : 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: isActive ? Colors.deepPurple : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const OnboardingPage({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 200.0,
          ),
          const SizedBox(height: 24.0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12.0),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 24.0),
        ],
      ),
    );
  }
}

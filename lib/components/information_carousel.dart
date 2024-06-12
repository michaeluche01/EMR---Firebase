import 'dart:async';

import 'package:flutter/material.dart';

class InfoCarousel extends StatefulWidget {
  const InfoCarousel({super.key});

  @override
  State<InfoCarousel> createState() => _InfoCarouselState();
}

class _InfoCarouselState extends State<InfoCarousel> {
  final PageController _pageController = PageController();
  late Timer _timer;
  int _currentPage = 0;

  final List<Map<String, String>> _infoPages = [
    {
      'title': 'Stay Hydrated',
      'content':
          'Drinking enough water is essential for maintaining bodily functions. Aim for at least 8 glasses of water a day. Hydration helps with digestion, nutrient absorption, and toxin elimination.',
    },
    {
      'title': 'Eat a Balanced Diet',
      'content':
          'Incorporate a variety of fruits, vegetables, lean proteins, and whole grains into your meals. A balanced diet provides essential vitamins, minerals, and energy needed for daily activities and overall health.',
    },
    {
      'title': 'Exercise Regularly',
      'content':
          'Engage in at least 150 minutes of moderate aerobic activity or 75 minutes of vigorous activity each week. Regular exercise improves cardiovascular health, strengthens muscles, and boosts mental well-being.',
    },
    {
      'title': 'Get Adequate Sleep',
      'content':
          'Aim for 7-9 hours of sleep per night. Quality sleep is crucial for physical and mental recovery, enhancing memory, mood, and overall health.',
    },
    {
      'title': 'Stay Mentally Active',
      'content':
          'Engage in activities that challenge your brain, such as puzzles, reading, learning new skills, or playing musical instruments. Mental stimulation helps maintain cognitive function and may reduce the risk of dementia.',
    },
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 7), (Timer timer) {
      if (_currentPage < _infoPages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: _infoPages.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Card(
            color: const Color.fromARGB(255, 196, 181, 185),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Image.network(
                //   _infoPages[index]['image']!,
                //   fit: BoxFit.cover,
                // ),
                // const SizedBox(height: 16),
                Text(
                  _infoPages[index]['title']!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    _infoPages[index]['content']!,
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

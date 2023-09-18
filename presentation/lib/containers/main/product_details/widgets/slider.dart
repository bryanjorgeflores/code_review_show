import 'dart:async';

import 'package:flutter/material.dart';
import 'package:presentation/styles/theme.dart';

class CarouselSlider extends StatefulWidget {
  final List<String> slides;
  final String heroId;
  final Map<String, String> env;
  final bool isInsideAStack;

  const CarouselSlider(
      {super.key,
      this.slides = const [],
      this.env = const {},
      this.isInsideAStack = false, required this.heroId});

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  final PageController _pageController = PageController(viewportFraction: 0.99);
  int _currentPage = 0;
  List<String> slides = [];
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    setState(() {
      slides = widget.slides;
    });
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < slides.length - 1) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      } else {
        _pageController.jumpToPage(0);
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = widget.isInsideAStack ? 250.0 : 200.0;
    return Hero(
      tag: widget.heroId,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: height,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                  _timer.cancel();
                  _startTimer();
                });
              },
              itemCount: slides.length,
              itemBuilder: (context, index) {
                final slider = slides[index];
                return Image.network(
                  slider,
                  height: height,
                  fit: BoxFit.fill,
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  slides.length,
                  (index) => buildDot(index),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    final size = _currentPage == index ? 8.0 : 6.0;
    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? Colors.blue : white,
      ),
    );
  }
}

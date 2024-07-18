import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class EDashboardHeader extends StatelessWidget {
  const EDashboardHeader({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: SizedBox(
              width: 285,
              height: double.infinity,
              child: Image.network(
                'https://picsum.photos/id/$index/285/120',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        pageSnapping: false,
        scrollBehavior:
        // configuring to swipe pageview with several device
        ScrollConfiguration.of(context).copyWith(dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
          PointerDeviceKind.trackpad,
        }),
      ),
    );
  }
}
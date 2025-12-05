import 'dart:async';
import 'package:flutter/material.dart';

class MyCustomCarousel extends StatefulWidget {
  const MyCustomCarousel({super.key});

  @override
  State<MyCustomCarousel> createState() => _MyCustomCarouselState();
}

class _MyCustomCarouselState extends State<MyCustomCarousel> {
  final PageController _controller = PageController(viewportFraction: 0.8);

  final List<String> imageAssets = [
    'assets/images/img2.jpeg',
    'assets/images/bk.jpg',
    'assets/images/bkb.jpeg',
  ];

  int currentIndex = 0;
  Timer? autoplayTimer;

  @override
  void initState() {
    super.initState();
    autoplayTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (_controller.hasClients) {
        currentIndex = (currentIndex + 1) % imageAssets.length;
        _controller.animateToPage(
          currentIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
        );
      }
    });
  }

  @override
  void dispose() {
    autoplayTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        controller: _controller,
        itemCount: imageAssets.length,
        onPageChanged: (i) => setState(() => currentIndex = i),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade300,
            ),

            child: Image.asset(
              imageAssets[index],
              fit: BoxFit.fill, 
              width: double.infinity,
              height: double.infinity,
            ),
          );
        },
      ),
    );
  }
}

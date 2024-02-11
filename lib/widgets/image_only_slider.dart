import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageOnlySlider extends StatelessWidget {
  const ImageOnlySlider({super.key});

  @override
  Widget build(BuildContext context) {
    CarouselController buttonCarouselController = CarouselController();

    final List<Widget> placeholders = [
      Image.asset('assets/seed1.jpg', fit: BoxFit.cover),
      Image.asset('assets/seed2.jpg', fit: BoxFit.cover),
      Image.asset('assets/seed3.jpg', fit: BoxFit.cover),
      Image.asset('assets/seed4.jpg', fit: BoxFit.cover),
      Image.asset('assets/seed5.jpg', fit: BoxFit.cover),
      Image.asset('assets/seed6.jpg', fit: BoxFit.cover),
      // Add more placeholder widgets as necessary
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Stack(
        children: [
          CarouselSlider(
            items: placeholders.map((placeholder) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                    ),
                    child: placeholder,
                  );
                },
              );
            }).toList(),
            carouselController: buttonCarouselController,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 1, // Adjust aspect ratio
              viewportFraction: 1.0, // Show only one item at a time
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.chevron_left,
                    ),
                    onPressed: () {
                      buttonCarouselController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.chevron_right,
                    ),
                    onPressed: () {
                      buttonCarouselController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

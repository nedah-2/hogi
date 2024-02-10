import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageOnlySlider extends StatelessWidget {
  const ImageOnlySlider({super.key});

  @override
  Widget build(BuildContext context) {
    CarouselController buttonCarouselController = CarouselController();

    final List<Widget> placeholders = [
      Container(color: Colors.grey), // Placeholder 1
      Container(color: Colors.blueGrey), // Placeholder 2
      Container(color: Colors.black26), // Placeholder 3
      Container(color: Colors.red), // Placeholder 4
      Container(color: Colors.green), // Placeholder 5
      Container(color: Colors.orange), // Placeholder 6
      Container(color: Colors.purple), // Placeholder 7
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
              aspectRatio: 4 / 3, // Adjust aspect ratio
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

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({Key? key}) : super(key: key);

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  CarouselController buttonCarouselController = CarouselController();
  int _currentIndex = 0;
  final ScrollController _scrollController = ScrollController();

  final List<Widget> _placeholders = [
    Container(color: Colors.grey), // Placeholder 1
    Container(color: Colors.blueGrey), // Placeholder 2
    Container(color: Colors.black26), // Placeholder 3
    Container(color: Colors.red), // Placeholder 4
    Container(color: Colors.green), // Placeholder 5
    Container(color: Colors.orange), // Placeholder 6
    Container(color: Colors.purple), // Placeholder 7
    // Add more placeholder widgets as necessary
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselSlider(
          items: _placeholders.map((placeholder) {
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
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
                _scrollToIndex(index);
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                buttonCarouselController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear);
              },
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                _placeholders.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? Colors.blue
                        : Colors.grey.shade300,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () {
                buttonCarouselController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear);
              },
            ),
          ],
        ),
        SizedBox(
          height: 72,
          child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount: _placeholders.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  buttonCarouselController.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear);
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Stack(
                      children: [
                        _placeholders[index],
                        if (index != _currentIndex)
                          Positioned.fill(
                            child: Container(
                              color: Colors.black.withOpacity(0.2),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _scrollToIndex(int index) {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        index * 128.0, // Adjust the value as per your item size
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}

import 'package:flutter/material.dart';

class TopBarAndPhotos extends StatefulWidget {
  const TopBarAndPhotos({super.key});

  @override
  State<TopBarAndPhotos> createState() => _TopBarAndPhotosState();
}

class _TopBarAndPhotosState extends State<TopBarAndPhotos> {
  final PageController pageController = PageController();
  int _currentPage = 0;
  bool _isFavorited = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          child: PageView.builder(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: 3, // Replace with actual number of product images
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(35),
                color: Colors.grey.shade200,
                child: Image.asset(
                  'images/assets/producttest.png',
                  fit: BoxFit.contain,
                ),
              );
            },
          ),
        ),

        Positioned(
          top: MediaQuery.of(context).padding.top + 10,
          left: 20,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: IconButton(
                  icon: Icon(
                    _isFavorited ? Icons.favorite : Icons.favorite_border,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _isFavorited = !_isFavorited;
                    });
                  },
                ),
              ),
            ],
          ),
        ),

        // Dots Indicator
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index
                      ? Colors.black
                      : Colors.grey.shade400,
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

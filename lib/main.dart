import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Slicing Figma',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        useMaterial3: true,
      ),
      home: const IsiSlicing(),
    );
  }
}

class IsiSlicing extends StatefulWidget {
  const IsiSlicing({super.key});

  @override
  State<IsiSlicing> createState() => _IsiSlicingState();
}

class _IsiSlicingState extends State<IsiSlicing> {
  int activeIndex = 0;

  final List<String> imagePaths = const [
    'assets/images/Dekor1.jpg',
    'assets/images/Dekor2.jpg',
    'assets/images/Dekor3.jpg',
    'assets/images/Dekor4.jpg',
    'assets/images/Dekor5.jpg'
  ];

  final CarouselSliderController buttonCarouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            'assets/images/menu.png',
            height: 17,
            width: 17,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'HouseMate',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            fontVariations: [FontVariation('wght', 500)],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            padding: const EdgeInsets.only(right: 16),
            icon: Image.asset(
              'assets/images/search.png',
              height: 18,
              width: 18,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            CarouselSlider(
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                height: 343,
                enlargeCenterPage: true,
                viewportFraction: 0.95,
                enableInfiniteScroll: true,
                onPageChanged: (index, reason) =>
                    setState(() => activeIndex = index),
              ),
              items: imagePaths.map((path) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(18.0),
                  child: Image.asset(
                    path,
                    fit: BoxFit.cover,
                    width: 335,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            buildIndicator(),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 80,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () => buttonCarouselController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                            color: Color(0xFF7A7469), width: 1.5),
                      ),
                    ),
                    child: Image.asset(
                      'assets/images/left-arrow.png',
                      height: 24,
                      width: 24,
                      color: const Color(0xFF707070),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: 80,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () => buttonCarouselController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7A7469),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Image.asset(
                      'assets/images/right-arrow.png',
                      height: 24,
                      width: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 18),
            Text(
              'Minimalist Furniture',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 28,
                fontVariations: [FontVariation('wght', 600)],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Bringing Simplicity, Elegance and Thoughtful Design\n to Your Home, One Piece of the Finest Quality.',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 11,
                fontVariations: [FontVariation('wght', 300)],
                letterSpacing: 0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 183,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'See Next',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 15,
                      fontVariations: [FontVariation('wght', 500)],
                      color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7A7469),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Color(0xFFD9D9D9),
              width: 1,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                icon: Image.asset(
                  'assets/images/house.png',
                  height: 19,
                  width: 19,
                ),
              ),
              IconButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                icon: Image.asset(
                  'assets/images/search.png',
                  height: 23,
                  width: 23,
                ),
              ),
              IconButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                icon: Image.asset(
                  'assets/images/shopping-cart.png',
                  height: 24,
                  width: 24,
                ),
              ),
              IconButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                icon: Image.asset(
                  'assets/images/settings.png',
                  height: 22,
                  width: 22,
                ),
              ),
              IconButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                icon: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.black),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      'assets/images/jaehyun.jpg',
                      height: 25,
                      width: 25,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: imagePaths.length,
        effect: WormEffect(
          spacing: 3,
          dotWidth: 8,
          dotHeight: 4,
          activeDotColor: const Color(0xFF7A7469),
          dotColor: const Color(0xFFD9D9D9),
        ),
      );
}

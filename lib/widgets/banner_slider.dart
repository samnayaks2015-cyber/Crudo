import 'package:flutter/material.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {

  final List<String> banners = [
    "assets/images/banner1.jpg",
    "assets/images/banner2.jpg",
    "assets/images/banner3.jpg",
  ];

  PageController controller = PageController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(
          height: 160,
          child: PageView.builder(
            controller: controller,
            itemCount: banners.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(banners[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 8),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            banners.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: currentPage == index ? 10 : 6,
              height: currentPage == index ? 10 : 6,

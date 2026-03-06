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

  int currentIndex = 0;
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(
          height: 170,
          child: PageView.builder(
            controller: controller,
            itemCount: banners.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {

              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    banners[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
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
              width: currentIndex == index ? 10 : 6,
              height: currentIndex == index ? 10 : 6,
              decoration: BoxDecoration(
                color: currentIndex == index
                    ? Colors.green
                    : Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
          ),
        )
      ],
    );
  }
}

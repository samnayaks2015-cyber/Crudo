import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {

  int activeIndex = 0;

  final List<String> banners = [
    "assets/images/banner1.png",
    "assets/images/banner2.png",
    "assets/images/banner3.png",
  ];

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        /// SLIDER

        CarouselSlider.builder(
          itemCount: banners.length,

          options: CarouselOptions(
            height: 170,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            enlargeCenterPage: true,
            viewportFraction: 0.92,

            onPageChanged: (index, reason){
              setState(() {
                activeIndex = index;
              });
            },
          ),

          itemBuilder: (context,index,realIndex){

            final banner = banners[index];

            return Container(
              margin: const EdgeInsets.symmetric(horizontal:5),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),

                image: DecorationImage(
                  image: AssetImage(banner),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),

        const SizedBox(height:10),

        /// INDICATOR DOTS

        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: banners.length,

          effect: const ExpandingDotsEffect(
            dotHeight: 8,
            dotWidth: 8,
            activeDotColor: Colors.green,
          ),
        ),

      ],
    );
  }
}

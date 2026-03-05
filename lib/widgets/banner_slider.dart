import 'package:flutter/material.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {

  final PageController controller = PageController();

  int currentPage = 0;

  final List<String> banners = [
    "assets/images/banner1.jpg",
    "assets/images/banner2.jpg",
    "assets/images/banner3.jpg",
  ];

  @override
  Widget build(BuildContext context) {

    return Column(

      children: [

        SizedBox(
          height: 180,

          child: PageView.builder(
            controller: controller,
            itemCount: banners.length,

            onPageChanged: (index){
              setState(() {
                currentPage = index;
              });
            },

            itemBuilder: (context,index){

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),

                  child: Image.asset(
                    banners[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),

CarouselSlider(
  options: CarouselOptions(
    height: 170,
    autoPlay: true,
    viewportFraction: 0.9,
    enlargeCenterPage: true,
  ),
  items: banners.map((item) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(item),
          fit: BoxFit.cover,
        ),
      ),
    );
  }).toList(),
)

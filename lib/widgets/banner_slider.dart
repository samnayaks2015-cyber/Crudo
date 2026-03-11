CarouselSlider(
  options: CarouselOptions(
    height: 180,
    viewportFraction: 0.92,
    autoPlay: true,
    enlargeCenterPage: true,
  ),
  items: banners.map((item) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          item,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }).toList(),
)

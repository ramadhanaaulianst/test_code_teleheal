import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerIklan extends StatefulWidget {
  const BannerIklan({
    Key? key,
  }) : super(key: key);

  @override
  State<BannerIklan> createState() => _BannerIklanState();
}

class _BannerIklanState extends State<BannerIklan> {
  List images = [
    "https://static.konsula.com/images/practice/0001001000/0001000249/rumah-sakit-ciputra-citra-garden-city2.800x600.jpg",
    "https://static.konsula.com/images/practice/0001001000/0001000998/rumah-sakit-mata-aini-prof-dr-isak-salim.800x600.jpg",
    "https://static.konsula.com/images/practice/0001002000/0001001134/rumah-sakit-kasih-budha-cinta-kasih-tzu-chi.800x600.jpg",
    "https://static.konsula.com/images/practice/0001001000/0001000404/rscm-kencana.800x600.png",
    "https://static.konsula.com/images/practice/0001001000/0001000668/rumah-sakit-ibu-and-anak-budhi-jaya.800x600.jpg"
  ];


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider.builder(
        itemCount: images.length,
        options: CarouselOptions(
          height: 150,
          autoPlay: true,
          reverse: true,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          autoPlayInterval: const Duration(seconds: 2),
        ),
        itemBuilder: (context, index, realIndex) {
          return Container(
            color: Colors.grey,
            width: double.infinity,
            child: Image.network(
              images[index].toString(),
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
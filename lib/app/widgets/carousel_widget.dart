import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ibaismedia/app/widgets/carousel_card_widget.dart';

class Carousel extends StatelessWidget {
  const Carousel({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: CarouselSlider(
        items: const [
          //1st Image of Slider
          CarouselCard(
              link:
                  "http://itekindia.com/IBAIS/products/Main Category/Bathroom.jpg"),

          //2nd Image of Slider
          CarouselCard(
              link:
                  "http://itekindia.com/IBAIS/products/Main Category/Glass.jpg"),

          //3rd Image of Slider
          CarouselCard(
              link:
                  "http://itekindia.com/IBAIS/products/Main Category/Hardware.jpg"),

          //4th Image of Slider
          CarouselCard(
              link:
                  "http://itekindia.com/IBAIS/products/Main Category/Kitchen.jpg"),

          //5th Image of Slider
          CarouselCard(
              link:
                  "http://itekindia.com/IBAIS/products/Main Category/Railing.jpg"),
        ],

        //Slider Container properties
        options: CarouselOptions(
          height: 180.0,
          enlargeCenterPage: true,
          enlargeFactor: 0.2,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 0.9,
        ),
      ),
    );
  }
}

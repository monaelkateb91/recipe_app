import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    var sliderIndex=0;
    CarouselController carouselControllerEx=CarouselController();

    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(
          children: [
            CarouselSlider(
              carouselController:carouselControllerEx ,
                items: [
                  Image.asset(
                    'assets/images/Cinnamon Toaast copy.png',
                  ),
                  Image.asset(
                    'assets/images/detail_GlazedSalmon_2 copy.png',
                  ),
                  Image.asset(
                    'assets/images/brown-eggs.jpg',
                  ),
                  Image.asset(
                    'assets/images/frensh toast 2 copy.png',
                  )
                ].map((i) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                  );
                }).toList(),
                options: CarouselOptions(
                    height: 200,
                    autoPlay: true,
                    viewportFraction: 0.75,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    enlargeCenterPage: true,
                    onPageChanged: (index, _) {
                      sliderIndex=index;
                      setState(() {

                      });
                      print('${index}');
                    })),
            DotsIndicator(
              dotsCount: 4,
              position: sliderIndex,
              onTap: (position) async{
               await carouselControllerEx.animateToPage(position);
               sliderIndex:position;
               setState(() {

               });
              },
              decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            )
          ],
        )),
      ),
    );
  }
}

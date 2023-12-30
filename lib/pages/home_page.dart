import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CarouselController carouselControllerEx=CarouselController();
  int sliderIndex=0;
  final images= [
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
    )];

  @override
  Widget build(BuildContext context) {




    return Scaffold(
      body: SafeArea(
        child:Column(
          children: [
            Stack(
              children: [
                CarouselSlider(
                    carouselController:carouselControllerEx ,
                    items:images,

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

                        })),
                Positioned.fill(
                  child: Align(child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () async{

                          await carouselControllerEx.previousPage();
                          setState(() {

                          });
                        },
                        icon: Icon(Icons.arrow_back),
                      ),IconButton(
                        onPressed: () async{

                          await carouselControllerEx.nextPage();
                          setState(() {

                          });
                        },
                        icon: Icon(Icons.arrow_forward),
                      )
                    ],
                  )),
                )

              ],
            )
            ,DotsIndicator( dotsCount: 4,
              position: sliderIndex,
              onTap: (position) async{
                await carouselControllerEx.animateToPage(position);
                sliderIndex=position;
                setState(() {

                });
              },
              decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            )],
        ) ,
      ),
    );












  }
}

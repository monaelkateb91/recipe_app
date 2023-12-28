import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  CarouselController carouselControllerEx=CarouselController();

  @override
  Widget build(BuildContext context) {




    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Stack(
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
                      print('${index}');
                    })),
            Align(alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () async{

                  await carouselControllerEx.previousPage();
                },
                icon: Icon(Icons.arrow_back),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () async{

                  await carouselControllerEx.nextPage();
                },
                icon: Icon(Icons.arrow_forward),
              ),),
            DotsIndicator(
              dotsCount: 4,
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
            )
          ],
        )),
      ),
    );
  }
}

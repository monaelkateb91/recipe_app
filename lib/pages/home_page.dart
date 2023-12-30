import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CarouselController carouselControllerEx = CarouselController();
  int sliderIndex = 0;
  final images = [
    Image.asset(
      'assets/images/Cinnamon Toaast copy.png',
    ),
    Image.asset(
      'assets/images/detail_GlazedSalmon_2 copy.png',
    ),
    Image.asset(
      'assets/images/lots-blueberries copy.jpg',
    ),
    Image.asset(
      'assets/images/frensh toast 2 copy.png',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.symmetric(),
          child: Icon(Icons.menu),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(),
            child: Icon(Icons.notification_add),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "What would you like to cook for today?",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black),
              ),
              Stack(
                children: [
                  CarouselSlider(
                      carouselController: carouselControllerEx,
                      items: images,
                      options: CarouselOptions(
                          height: 200,
                          autoPlay: true,
                          viewportFraction: 0.75,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          enlargeCenterPage: true,
                          onPageChanged: (index, _) {
                            sliderIndex = index;
                            setState(() {});
                          })),
                  Positioned.fill(
                    child: Align(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () async {
                            await carouselControllerEx.previousPage();
                            setState(() {});
                          },
                          icon: Icon(Icons.arrow_back),
                        ),
                        IconButton(
                          onPressed: () async {
                            await carouselControllerEx.nextPage();
                            setState(() {});
                          },
                          icon: Icon(Icons.arrow_forward),
                        )
                      ],
                    )),
                  )
                ],
              ),
              DotsIndicator(
                dotsCount: 4,
                position: sliderIndex,
                onTap: (position) async {
                  await carouselControllerEx.animateToPage(position);
                  sliderIndex = position;
                  setState(() {});
                },
                decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Today's Fresh Recipes",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(color: Colors.orange),
                  )
                ],
              ),

                Positioned.fill( right: 8,top:8,
                  child: Row(
                    children: [
                      Card(
                        child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.grey,
                                  ),
                                  (Image.asset(
                                    'assets/images/frensh toast 2 copy.png',
                                  )),
                                  SizedBox(
                                    width: 5,
                                  ),

                                      Container(
                                        child: Text(
                                          "Breakfast",
                                          style:
                                              TextStyle(fontSize: 10, color: Colors.blue),
                                        ),
                                      ),


                                ],
                              ),
                            ),
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Card(
                        child: Container(
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.deepOrange,
                                  ),
                                  (Image.asset(
                                    'assets/images/Cinnamon Toaast copy.png',
                                    scale: 3,
                                  )),
                                  Container(
                                    child: Text(
                                      "Breakfast",
                                      style:
                                      TextStyle(fontSize: 10, color: Colors.blue),
                                    ),
                                  ),
                                ]),
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20))),
                      )
                    ],
                  ),
                ),
              
            ],
          ),
        ),
      ),
    );
  }
}

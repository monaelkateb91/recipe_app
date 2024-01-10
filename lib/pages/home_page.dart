
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/pages/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CarouselController carouselControllerEx = CarouselController();
  int sliderIndex = 0;

  //List<Ad> adsList = [];

  //void getAds() async {
    //var adsData = await rootBundle.loadString('assets/data/sample.json');
    //var dataDecoded =
    //List<Map<String, dynamic>>.from(jsonDecode(adsData)['ads']);

    //adsList = dataDecoded.map((e) => Ad.fromJson(e)).toList();
    //setState(() {});

 // }


 // @override
 // void initState() {
    //getAds();
   // super.initState();
 // }

  @override
  Widget build(BuildContext context) {
    return Consumer<AdsProvider>(builder: (context, adsprovider,child){
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.symmetric(),
          child: Icon(Icons.menu),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(),
            child: Icon(Icons.notification_add),
          )
        ],
      ),
      body: SafeArea(

          child: //adsList.isEmpty
              //? const
          //CircularProgressIndicator()
      SingleChildScrollView(
            child: Column(
              children: [
                CarouselSlider(
                  carouselController: carouselControllerEx,
                  options: CarouselOptions(
                      autoPlay: true,
                      height: 200,
                      viewportFraction: .75,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      enlargeCenterPage: true,
                      onPageChanged: (index, _) {
                        sliderIndex = index;
                        setState(() {});
                      },
                      enlargeFactor: .3),
                  items: adsprovider.adsList.map((ad) {
                    return Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin:
                          const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  image: NetworkImage(ad.image!))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black38,
                                borderRadius: BorderRadius.circular(25)),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                ad.title.toString(),
                                style: const TextStyle(
                                    fontSize: 16.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),

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
                          icon: const Icon(Icons.arrow_back),
                        ),
                        IconButton(
                          onPressed: () async {
                            await carouselControllerEx.nextPage();
                            setState(() {});
                          },
                          icon: const Icon(Icons.arrow_forward),
                        )
                      ],
                    )),
                  )
                ,

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
              const SingleChildScrollView(
                child: Row(
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
              ),

              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly
                ,children: [


                Card(
                elevation: 2,
                child: Container(
                    width: 240,
                    decoration: BoxDecoration(
                        color:
                        Colors.transparent,

                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 15),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.favorite_outline,
                                color: Colors.grey,
                              ),
                              Transform.translate(
                                offset: const Offset(20, 0),
                                child: Image.asset(
                                  'assets/images/frensh toast 2 copy.png',
                                  height: 140,
                                  width: 200,
                                  fit: BoxFit.fitHeight,
                                ),
                              )
                            ],
                          ),
                          const Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Breakfast',
                                    style: TextStyle(
                                        color: Color(0xff1F95B3),
                                        fontSize: 13),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                EdgeInsets.symmetric(vertical: 4),
                                child: Row(
                                  children: [
                                    Text(
                                      'Fresh Toast With Barries',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color:Colors.orange,
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  children: [
                                    Text(
                                      '120 Calories',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color:
                                          Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '10 mins',
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '1 serving',
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
              ),Card(
                    elevation: 2,
                    child: Container(
                        width: 240,
                        decoration: BoxDecoration(
                            color:
                              Colors.transparent,

                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, left: 15),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.favorite_outline,
                                    color: Colors.grey,
                                  ),
                                  Transform.translate(
                                    offset: const Offset(20, 0),
                                    child: Image.asset(
                                      'assets/images/Cinnamon Toaast copy.png',
                                      height: 140,
                                      width: 200,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  )
                                ],
                              ),
                              const Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Breakfast',
                                        style: TextStyle(
                                            color: Color(0xff1F95B3),
                                            fontSize: 13),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsets.symmetric(vertical: 4),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Brown Suger Cinnmon Toast',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color:Colors.orange,
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsets.symmetric(vertical: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '120 Calories',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color:
                                              Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        size: 18,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        '10 mins',
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        size: 18,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        '1 serving',
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                  ),
                ],)


          ]),
        ),

    ));
  });
}
}
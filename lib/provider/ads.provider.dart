import 'package:carousel_slider/carousel_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/model/ad_model.dart';



class AdsProvider extends ChangeNotifier {
  List<Ad>? _adsList;

  List<Ad>? get adsList => _adsList;
  int sliderIndex = 0;
  CarouselController? carouselController;

  void onPageChanged(int index) {
    sliderIndex = index;
    notifyListeners();
  }

  void disposeCarousel() {
    carouselController = null;
  }

  void onDotTapped(int position) async {
    await carouselController?.animateToPage(position);
    sliderIndex = position;
    notifyListeners();
  }

  void initCarousel() {
    carouselController = CarouselController();
  }

  Future<void> getAds() async {
    try {
      var result = await FirebaseFirestore.instance
          .collection('ads')
          .where('isActive', isEqualTo: true)
          .get();

      if (result.docs.isNotEmpty) {
        _adsList = List<Ad>.from(
            result.docs.map((doc) => Ad.fromJson(doc.data(), doc.id)));
      } else {
        _adsList = [];
      }
      notifyListeners();
    } catch (e) {
      _adsList = [];
      notifyListeners();
    }
  }
}
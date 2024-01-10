import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/ad_model.dart';

class AdsProvider extends ChangeNotifier{
  List<Ad> adsList = [];

  Future<void> getAds() async {
    var adsData = await rootBundle.loadString('assets/data/sample.json');
    var dataDecoded =
    List<Map<String, dynamic>>.from(jsonDecode(adsData)['ads']);

    adsList = dataDecoded.map((e) => Ad.fromJson(e)).toList();
    notifyListeners();

}}
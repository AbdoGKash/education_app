import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/values_manager.dart';

Widget showBanner() {
  return CarouselSlider(
    options: CarouselOptions(
        height: 200, autoPlay: true, enableInfiniteScroll: true),
    items: [
      Image.asset(
        ImageAssets.one,
        width: AppSize.s250,
      ),
      Image.asset(
        ImageAssets.two,
        width: AppSize.s250,
      ),
      Image.asset(
        ImageAssets.three,
        width: AppSize.s250,
      ),
    ],
  );
}

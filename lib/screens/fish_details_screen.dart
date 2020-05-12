import 'package:critterpedia/models/fish_model.dart';
import 'package:critterpedia/widgets/fish_details_availability_widget.dart';
import 'package:critterpedia/widgets/fish_details_header_widget.dart';
import 'package:critterpedia/widgets/fish_details_phrases_widget.dart';
import 'package:critterpedia/widgets/fish_details_price_location_widget.dart';
import 'package:critterpedia/widgets/fish_details_title_widget.dart';
import 'package:flutter/material.dart';

class FishDetailsScreen extends StatelessWidget {
  FishDetailsScreen(
    this.fish,
    this.hemisphere,
  );

  final Fish fish;
  final String hemisphere;

  final LinearGradient linearGradient = LinearGradient(
    begin: FractionalOffset.topCenter,
    end: FractionalOffset.bottomCenter,
    colors: <Color>[
      const Color(0xFFADD8E6),
      const Color(0xFFFFFFFF),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(gradient: linearGradient),
          child: Column(
            children: <Widget>[
              FishDetailsHeaderWidget(fish),
              FishDetailsTitleWidget(
                title: fish.name ?? '',
                rarity: fish.rarity ?? '',
              ),
              FishDetailsAvailabilityWidget(
                fish,
                hemisphere,
              ),
              FishDetailsPriceLocationWidget(
                price: fish.price,
                location: fish.location,
              ),
              FishDetailsPhrasesWidget(
                catchPhrases: fish.catchPhrase,
                museumPhrases: fish.museumPhrase,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

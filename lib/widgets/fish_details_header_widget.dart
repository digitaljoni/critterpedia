import 'package:critterpedia/models/fish_model.dart';
import 'package:critterpedia/widgets/fish_icon_widget.dart';
import 'package:flutter/material.dart';

class FishDetailsHeaderWidget extends StatelessWidget {
  FishDetailsHeaderWidget(this.fish);

  final Fish fish;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 2.5,
        child: Stack(
          children: <Widget>[
            _FishDetailTopImage(fish.id),
            _FishDetailIcon(fish.id),
            Positioned(
              top: 36.0,
              left: 10.0,
              child: BackButton(
                color: Colors.white,
              ),
            )
          ],
        ));
  }
}

class _FishDetailTopImage extends StatelessWidget {
  _FishDetailTopImage(this.fishId);
  final int fishId;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -40.0,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(MediaQuery.of(context).size.width / 2),
          bottomRight: Radius.circular(MediaQuery.of(context).size.width / 2),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height / 2.5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('http://acnhapi.com/images/fish/$fishId'),
              fit: BoxFit.cover,
            ),
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}

class _FishDetailIcon extends StatelessWidget {
  _FishDetailIcon(this.fishId);
  final int fishId;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FishIconWidget(fishId),
    );
  }
}

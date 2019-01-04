import 'package:flutter/material.dart';
import 'package:hello_world/models/location.dart';
import 'package:hello_world/styles.dart';

const LocationTileHeight = 100.0;

class LocationTile extends StatelessWidget{
  final Location location;
  final bool darkTheme;

  LocationTile({this.location, this.darkTheme});

  @override
  Widget build(BuildContext context) {
    final title = location.name.toUpperCase();
    final subTitle = location.userItinerarySummary.toUpperCase();
    final caption = location.tourPackageName.toUpperCase();

    return Container(
      padding: EdgeInsets.all(0.0),
      height: LocationTileHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('$title',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: this.darkTheme ? Styles.locationTileTitleDark : Styles.locationTileTitleLight,
          ),
          Text('$subTitle', style: Styles.locationTileSubTitle,),
          Text('$caption', style: Styles.locationTileCaption)
        ],
      ),
    );
  }

}
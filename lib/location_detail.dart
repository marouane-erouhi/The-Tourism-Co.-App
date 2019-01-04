import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'models/location.dart';
import 'components/location_tile.dart';
import 'styles.dart';

const BannerImageHeight = 300.0;
const BodyVerticalPadding = 20.0;
const FooterHeight = 100.0;

class LocationDetail extends StatefulWidget {
  final int locationID;

  LocationDetail(this.locationID);

  @override
  createState() => _LocationDetailState(locationID);
}

class _LocationDetailState extends State<LocationDetail> {
  final int locationID;
  Location location = Location.blank();

  _LocationDetailState(this.locationID);

  @override
  void initState(){
    super.initState();
    loadData();
  }

  loadData() async{
    if(mounted){
      final location = await Location.fetchById(this.locationID);
      setState((){
        this.location = location;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          location.name,
          style: Styles.navBarTitle
        ),
      ),
      body: Stack(
        children:[
          _renderBody(context,location),
          _renderFooter(context, location)
        ],
      )
    );
  }

  Widget _renderBody(BuildContext context, Location location){
    var result = List<Widget>();
    result.add(_bannerImage(location.url, BannerImageHeight));
    result.add(_renderHeader());
    result.addAll(_renderFacts(context, location));
    return SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: result
        ),
    );
  }

  Widget _renderFooter(BuildContext context, Location location){
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.7)),
          height: FooterHeight,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal:30.0),
            child: _renderBookButton(),
          ),
        )
      ],
    );
  }

  Widget _renderBookButton(){
    return FlatButton(
      color: Styles.accentColor,
      textColor: Styles.textColorBright,
      onPressed: () => _handleBookPress,
      child: Text('Book'.toUpperCase(), style: Styles.textCTAButton),
    );
  }

  _handleBookPress() async{
    const url = 'mailot:hello@tourism.co?subject=inquiry';
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw 'Could not  launch $url';
    }
  } 

  Widget _renderHeader(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: BodyVerticalPadding, horizontal: Styles.horizontalPaddingDefault),
      child: LocationTile(location: this.location, darkTheme: false,),
    );
  }

  List<Widget> _renderFacts(BuildContext context, Location location){
    var result = List<Widget>();
    for(final locationFact in location.facts){
      result.add(_sectionTitle(locationFact.title));
      result.add(_sectionText(locationFact.text));
    }
    return result;
  }
  Widget _sectionTitle(String text){
    return Container(
      padding: EdgeInsets.fromLTRB(Styles.horizontalPaddingDefault, 25.0, Styles.horizontalPaddingDefault, 0.0),
      child: Text(
        text.toUpperCase(),
        textAlign: TextAlign.left,
        style: Styles.headerLarge
      )
    );
  }
  Widget _sectionText(String text){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: Styles.horizontalPaddingDefault),
      child: Text(
        text,
        style: Styles.textDefault,
      )
    );
  }
  Widget _bannerImage(String url, double height){
    Image image;
    try{
      if(url.isNotEmpty){
        image = Image.network(url, fit:BoxFit.fitWidth);
      }
    }catch(e){
      print('could not load image from $url');
    }
    return Container(
      constraints: BoxConstraints.tightFor(height: height),
      child: image
    );
  }
  
}


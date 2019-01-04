import 'package:flutter/material.dart';
import 'dart:async';
import 'models/location.dart';
import 'components/default_app_bar.dart';
import 'components/location_tile.dart';
import 'components/banner_image.dart';
import 'styles.dart';
import 'location_detail.dart';

const listItemHeight = 245.0;

class LocationList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LocationListState();

}
class _LocationListState extends State<LocationList>{
  List<Location> _locations = [];
  bool loading = false;

  @override
  void initState(){
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(),
      body: RefreshIndicator(
        onRefresh: loadData,
        child: Column(
          children:[ 
            _renderProgressBar(context),
            Expanded( child: _renderListView(context)),
          ]
        )
    ));
  }

  Future<void> loadData() async{
    if(mounted){
      setState(() => loading = true);
      final locations = await Location.fetchAll();
      setState(() {
        this._locations = locations;
        this.loading = false;
      });
    }
  }

  Widget _renderProgressBar(BuildContext context){
    return (this.loading ? LinearProgressIndicator(
      value: null,
      backgroundColor: Colors.white,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
    ) : Container());
  }

  Widget _renderListView(BuildContext context){
    return ListView.builder(
      itemCount: _locations.length,
      itemBuilder: _listViewItemBuilder,
    );
  }

  Widget _listViewItemBuilder(BuildContext context, int index){
    Location location = _locations[index];
    return GestureDetector(
      onTap: () => _navigateToLocationDetail(context, location.id),
      child: Container(
        height: listItemHeight,
        child: Stack(
          children: [
            BannerImage(url:location.url, height:listItemHeight),
            _tileFooter(location)            
          ]
        ),
      )
    );
  }

  void _navigateToLocationDetail(BuildContext context, int locationID){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationDetail(locationID),
        ));
  }

  Widget _tileImage(String url, double width, double height){
    return Container(
      constraints: BoxConstraints.expand(),
      child: Image.network(url, fit:BoxFit.cover),
    );
  }
  Widget _itemTitle(Location location){
    return Text(location.name, style: Styles.textDefault);
  }

  Widget _tileFooter(Location location){
    final info = LocationTile(location: location, darkTheme: true,);
    final overlay = Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: Styles.horizontalPaddingDefault),
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
      child: info,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
         overlay,
      ],
    );
  }

}
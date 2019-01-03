import 'package:flutter/material.dart';
import 'models/location.dart';
import 'styles.dart';
import 'location_detail.dart';

class LocationList extends StatelessWidget{
  final List<Location> _locations;

  LocationList(this._locations);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Locations",
          style: Styles.navBarTitle
        ),
      ),
      body: ListView.builder(
        itemCount: _locations.length,
        itemBuilder: _listViewItemBuilder,
      )
    );
  }

  Widget _listViewItemBuilder(BuildContext context, int index){
    print("_listViewItemBuilder run");
    Location location = _locations[index];
    return ListTile(
      leading: _itemThumbnail(location),
      title: _itemTitle(location),
      contentPadding: EdgeInsets.all(10.0),
      onTap: (){
        _navigateToLocationDetail(context,index);
      },
    );
  }

  void _navigateToLocationDetail(BuildContext context, int locationID){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationDetail(locationID),
        ));
  }

  Widget _itemThumbnail(Location location){
    return Container(
      constraints: BoxConstraints(
        maxWidth: 100.0
      ),
      child: Image.network(location.url, fit:BoxFit.fitHeight),
    );
  }
  Widget _itemTitle(Location location){
    return Text(location.name, style: Styles.textDefault);
  }

}
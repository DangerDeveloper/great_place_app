import 'package:flutter/material.dart';
import 'package:greatplaceapp/models/place.dart';
import 'package:greatplaceapp/providers/great_places.dart';
import 'package:greatplaceapp/screens/map_screen.dart';
import 'package:provider/provider.dart';

class PlaceDetailScreen extends StatelessWidget {
  static const routeName = '/place_detail-screen';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final data = Provider.of<GreatPlaces>(context).findById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(data.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 200.0,
            child: Image.file(
              data.image,
              width: double.infinity,
              height: 200.0,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            data.location.address,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => MapScreen(
                    isSelecting: false,
                    initialLocation: PlaceLocation(
                      latitude: data.location.latitude,
                      longitude: data.location.longitude,
                    ),
                  ),
                  fullscreenDialog: true,
                ),
              );
            },
            child: Text('Open in Map'),
          ),
        ],
      ),
    );
  }
}

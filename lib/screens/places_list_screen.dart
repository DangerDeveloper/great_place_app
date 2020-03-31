import 'package:flutter/material.dart';
import 'package:greatplaceapp/providers/great_places.dart';
import 'package:greatplaceapp/screens/add_place_screen.dart';
import 'package:greatplaceapp/screens/place_detail_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              }),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPLaces(),
        builder: (ctx, snapShot) => snapShot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatPlaces>(
                child: Center(
                  child: const Text('Nothing'),
                ),
                builder: (ctx, greatPlace, ch) => greatPlace.list.length <= 0
                    ? ch
                    : ListView.builder(
                        itemCount: greatPlace.list.length,
                        itemBuilder: (ct, i) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                FileImage(greatPlace.list[i].image),
                          ),
                          title: Text(greatPlace.list[i].title),
                          subtitle: Text(greatPlace.list[i].location.address),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                PlaceDetailScreen.routeName,
                                arguments: greatPlace.list[i].id);
                          },
                        ),
                      ),
              ),
      ),
    );
  }
}

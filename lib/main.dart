import 'package:flutter/material.dart';
import 'package:greatplaceapp/providers/great_places.dart';
import 'package:greatplaceapp/screens/add_place_screen.dart';
import 'package:greatplaceapp/screens/place_detail_screen.dart';
import 'package:greatplaceapp/screens/places_list_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Great Place',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: PlacesListScreen(),
        routes: {
          AddPlaceScreen.routeName: (ctx) => AddPlaceScreen(),
          PlaceDetailScreen.routeName: (ctx) => PlaceDetailScreen(),
        },
      ),
    );
  }
}
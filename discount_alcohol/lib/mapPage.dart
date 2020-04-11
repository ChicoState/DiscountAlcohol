import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// widget to render the page for Google map lookups
class MapPageFrame extends StatelessWidget {

  @override
  MapPageFrame(this.initialSearchDrink);

  // this string is passed all the way down to MapPageState
  // to populate initial value of the search field
  // assigned on construction by homepage onTap() event
  final String initialSearchDrink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // prevents Google Maps from resizing when keyboard is open
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("DiscountAlcohol"),
      ),
      body: MapPage(initialSearchDrink),
    );
  }
}

class MapPage extends StatefulWidget {

  MapPage(this._drinkSearch);

  final String _drinkSearch;

  @override
  MapPageState createState() => MapPageState(_drinkSearch);
}

class MapPageState extends State<MapPage> {

  GoogleMapController mapController;

  final LatLng _center = const LatLng(39.728786, -121.837580);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _addMarker();
  }

  // CHANGE ALL OF THE BELOW WHEN DATABASE IS ESTABLISHED
  // For marker something we might want to change when database shows up
  final Set<Marker> _markers = {};

  void _addMarker() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId("1"),
        position: LatLng(39.749943, -121.826413),
        infoWindow: InfoWindow(
          title: 'Spike\'s Bottle Shop',
          snippet: 'Average Price: \$5.65',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId("2"),
        position: LatLng(39.724322, -121.848992),
        infoWindow: InfoWindow(
          title: 'Ray\'s Liquor',
          snippet: 'Average Price: \$6.32',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId("3"),
        position: LatLng(39.746370, -121.831072),
        infoWindow: InfoWindow(
          title: 'Finnegan\'s Jug Liquor',
          snippet: 'Average Price: \$5.55',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId("4"),
        position: LatLng(39.730476, -121.858068),
        infoWindow: InfoWindow(
          title: 'Star Liquors',
          snippet: 'Average Price: \$6.13',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId("5"),
        position: LatLng(39.748536, -121.853935),
        infoWindow: InfoWindow(
          title: 'Anthony\'s Liquor',
          snippet: 'Average Price: \$5.21',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }
  // CHANGE ALL OF THE ABOVE WHEN DATABASE IS ESTABLISHED

  MapPageState(this._drinkSearch);

  // state variables for this page
  String _drinkSearch;    // form: type of drink to search for (e.g. beer)
  int _searchRadius = 1;  // filter
  int _maxPrice = 10;     // filter



  // helper function for generating dropdown menu
  List<DropdownMenuItem<int>> getDistanceDropdownItems() {
    return [
      DropdownMenuItem<int>(value: 1, child: Text("1 mi")),
      DropdownMenuItem<int>(value: 3, child: Text("3 mi")),
      DropdownMenuItem<int>(value: 5, child: Text("5 mi")),
      DropdownMenuItem<int>(value: 10, child: Text("10 mi")),
      DropdownMenuItem<int>(value: 20, child: Text("20 mi")),
      DropdownMenuItem<int>(value: 50, child: Text("50 mi")),
    ];
  }

  Widget build(BuildContext context) {
    // a column containing the filter (as a form) and the google maps view
    return Column(
      children: <Widget>[
        // the filter/search form, should contain all necessary fields within
        Form(
          child: Container(
            decoration: BoxDecoration(
            border: Border.all(color: Colors.deepOrange, width: 4.0),
            ),
            padding: EdgeInsets.all(24.0),
            child: Column(
              children: <Widget>[
                // the beverage to search for
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Drink: ",
                    contentPadding: EdgeInsets.fromLTRB(24, 6, 24, 6),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      borderSide: BorderSide(
                        width: 2.0,
                      )
                    ),
                  ),
                  initialValue: _drinkSearch,
                ),
                // this Row here allows the next Widgets to be on the same horizontal line
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // the field for filtering by distance
                    Text("Within:  "),
                    Container(
                      width: 100,
                      child: DropdownButtonFormField<int>(
                        value: _searchRadius,
                        hint: Text("Distance"),
                        items: getDistanceDropdownItems(),
                        onChanged: (int newValue) {
                          _searchRadius = newValue;
                          setState((){});
                        }
                      ),
                    ),
                    // the field for filtering by price
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 12, 0, 0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Max Price: ",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(40.0)),
                              borderSide: BorderSide(
                                width: 2.0,
                              )
                            )
                          ),
                          initialValue: _maxPrice.toString(),
                          onSaved: (String newValue) => setState(() {
                            _maxPrice = int.parse(newValue);
                          }),
                          keyboardType: TextInputType.number,
                        )
                      )
                    )
                  ]
                )
              ]
            )
          )
        ),
          Flexible(
              child: Center(
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  markers: _markers,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 11.0,
                  ),
                ),
            )
          )
      ]
    );
  }
}

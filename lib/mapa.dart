import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaPage extends StatefulWidget {
  MapaPage({Key? key}) : super(key: key);

  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> marker = [];

  @override
  void initState(){
  marks();
  super.initState();
}

void marks (){
  Marker etiquetauno=Marker(
  markerId: MarkerId('Calle Arce'),
  position:LatLng( 13.84028 , -89.44722 ),
  infoWindow: InfoWindow(title: 'MovilSV Calle Arce'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
  BitmapDescriptor.hueYellow
),
);

  Marker etiquetados=Marker(
  markerId: MarkerId('Salvador del mundo'),
  position:LatLng( 13.701497372731993, -89.22442257379012),
  infoWindow: InfoWindow(title: 'MovilSV, El Salvador del Mundo'),
  
  icon: BitmapDescriptor.defaultMarkerWithHue(
  BitmapDescriptor.hueRed
  ),
);

Marker etiquetatres=Marker(
  markerId: MarkerId('Soyapango'),
  position:LatLng( 13.71845236317209, -89.13256616898981 ),
  infoWindow: InfoWindow(title: 'MovilSV, Soyapango'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
  BitmapDescriptor.hueGreen
),
);

    setState(() {
    marker.add(etiquetauno);
    marker.add(etiquetados);
    marker.add(etiquetatres);
 

});

  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(13.69, -89.19),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
      markers: marker.map((e) => e).toSet(),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
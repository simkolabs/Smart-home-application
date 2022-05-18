import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

import 'package:home_security/user/allshops.dart';

class HomeMap extends StatefulWidget {
  const HomeMap({Key? key}) : super(key: key);

  @override
  State<HomeMap> createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  LocationSettings locationSettings =LocationSettings(
      accuracy: LocationAccuracy.best,distanceFilter: 1
  );
  BitmapDescriptor ? customIcon;
  Position ? current;
  String ?error;
  LatLng ?initital = LatLng(0, 0);
  GoogleMapController ? control;
  bool loading=false;
  List<LatLng> polylineCoordinates = [];
  Map<PolylineId, Polyline> polylines = {};
  Set <Marker>marks={};
  Uint8List? markerIcon;
  bool show =false;
  void change(){
    dispose();
    setState(() {show =!show;});
  }
  void getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    markerIcon= (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBytesFromAsset('assets/location.png', 150);
    locationservice();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return (show)?shops(change: change,):Container(

      child: SafeArea(
        child: Stack(
          children: [
            Align(
              child: Container(
                padding: EdgeInsets.only(top: 35),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(target: initital!, zoom: 16),
                  onMapCreated: (GoogleMapController ctrl) {
                    control = ctrl;
                  },
                  markers: marks,
                  polylines: Set<Polyline>.of(polylines.values),

                ),

              ),
              alignment: Alignment.center,
            ),
            Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width*0.8,
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: EdgeInsets.all(15),
                        fillColor: Colors.grey[200],
                        filled: true,
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.search)
                    ),),
                )
            ),
            Align(
              child:Container(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width*0.05),
                width: MediaQuery.of(context).size.width*0.7,
                child: Container(
                    height: MediaQuery.of(context).size.height*0.06,
                    child: ElevatedButton(onPressed: (){
                      setState(() {
                        show=true;
                      });
                    },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(0.0),
                      ),
                      child:Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [Colors.blueAccent, Colors.lightBlue.shade200]),

                        ),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                          alignment: Alignment.center,
                          child: const Text(
                            'View all shops',
                            style:
                            const TextStyle(fontSize: 13,color: Colors.white),
                          ),
                        ),
                      ),)

                ),
              ),
              alignment: Alignment.bottomCenter,

            )
          ],
        ),
      ),
    );
  }

  Future locationservice() async {
    bool serviceen = await Geolocator.isLocationServiceEnabled();
      LocationPermission check =await Geolocator.checkPermission();
      var get =await Geolocator.requestPermission();
      if (check==LocationPermission.denied) {
        setState(() {
          error = "Service Not Enabled";
          return;
        });
      }


    current = await Geolocator.getCurrentPosition();
    Geolocator.getPositionStream(locationSettings: locationSettings).distinct().listen((event) async {
      setState(() {
        current = event;
        initital = LatLng(event.latitude, event.longitude);
        marks.clear();
        marks.add(Marker(markerId:MarkerId('current'),icon: BitmapDescriptor.fromBytes(markerIcon!),position: LatLng(current!.latitude,current!.longitude) ),);
        control?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: LatLng(event.latitude, event.longitude), zoom: 16)));
      });

    }


    );
  }
}

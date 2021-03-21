import 'dart:async';

import 'package:handly_app/models/location_model.dart';
import 'package:location/location.dart';



class LocationService{

  Location location = new Location();
  LocationModel currentLocation;

  StreamController<LocationModel> locationController = StreamController<LocationModel>.broadcast();

  Stream<LocationModel> get getStreamData => locationController.stream;


  LocationService() {
    location.requestPermission().then((locationPermission) {
      if (locationPermission == PermissionStatus.granted){
        location.onLocationChanged.listen((locationValue) {
          locationController.add(
            LocationModel(latitude: locationValue.latitude, longitude: locationValue.longitude)
          );
        });
      }
    });
  }

}




Future getLocation () async {


  Location _location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;


  _serviceEnabled = await _location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await _location.requestService();
    if (!_serviceEnabled) {
      return;
    }
  }


  _permissionGranted = await _location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await _location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return;
    }
  }

  _locationData = await _location.getLocation();

  return _locationData;

}
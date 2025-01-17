import 'package:geolocator/geolocator.dart';

class LocationHelper{
  Future<Position> getCurrentLocation()async{
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      return Future.error("Location services are disabled");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error("Location Permissions are denied");
      }
    }

    if(permission == LocationPermission.deniedForever){
      return Future.error(
        "Location permissions are permanently denied, we cannot request"
      );
    }
    return await Geolocator.getCurrentPosition();
  }
}
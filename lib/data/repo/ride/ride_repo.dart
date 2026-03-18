import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';

abstract class RideRepo {
  List<Ride> getRidesFor(RidePreference ridePref);
}
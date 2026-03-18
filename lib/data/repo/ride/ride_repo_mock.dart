import 'package:blabla/data/dummy_data.dart';
import 'package:blabla/data/repo/ride/ride_repo.dart';
import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';

class RideRepoMock implements RideRepo{
  static List<Ride> allRides = fakeRides;
  @override
  List<Ride> getRidesFor(RidePreference ridePref) {
    return allRides
        .where(
          (ride) =>
              ride.departureLocation == ridePref.departure &&
              ride.arrivalLocation == ridePref.arrival &&
              ride.availableSeats >= ridePref.requestedSeats
        )
        .toList();
  }
}
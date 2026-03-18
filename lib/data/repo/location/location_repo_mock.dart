import 'package:blabla/data/dummy_data.dart';
import 'package:blabla/data/repo/location/location_repo.dart';
import 'package:blabla/model/ride/locations.dart';

class LocationRepoMock implements LocationRepo{

  @override
  List<Location> availableLocation() {
    return fakeLocations;
  }
}
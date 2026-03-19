import 'package:blabla/data/repo/ride/ride_repo.dart';
import 'package:blabla/ui/screens/rides_selection/view_model/rides_selection_view_model.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/rides_selection_content.dart';
import 'package:blabla/ui/states/ride_pref_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RidesSelectionScreen extends StatelessWidget{
  const RidesSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RidesSelectionViewModel(
        ridePrefState: context.read<RidePrefState>(), 
        rideRepo: context.read<RideRepo>()),
      child: RidesSelectionContent(),);
  }
}
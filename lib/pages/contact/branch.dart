import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../dimensions/dimensions.dart';

class Branch extends StatelessWidget {
  const Branch({
    Key? key,
    required this.branchName,
    required this.address,
    required this.landline,
    required this.email,
    required this.cell,
    required this.latLng,
  }) : super(key: key);

  const Branch.headOffice({Key? key})
      : this(
          key: key,
          branchName: 'Head Office Branch',
          address:
              'Office 106,108 & 109 1st Floor \nPrince\'s Flats, Fort Street & 9th Ave\nBulawayo',
          landline: '0292260274/5\n0292272218',
          email: 'darnsterfin@gmail.com',
          cell: '0773373867\n0777024405',
          latLng: const LatLng(-20.156817, 28.580317),
        );

  const Branch.chipinge({Key? key})
      : this(
          key: key,
          branchName: 'Chipinge Branch',
          address: '64 Joubert Street \nOffice 6 Sirda Building\nChipinge',
          landline: '(0227) 272042531',
          email: 'darnsterfin@gmail.com',
          cell: ' 0776180434',
          latLng: const LatLng(-20.192788, 32.619779),
        );

  final String branchName;
  final String address;
  final String landline;
  final String email;
  final String cell;
  final LatLng latLng;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          width: 300, // Fixed width for branch info
          child: Card(
            elevation: 5,
            shadowColor: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.paddingRegular),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    branchName,
                    style: const TextStyle(
                      fontSize: Dimensions.regular,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    address,
                    style: const TextStyle(fontSize: Dimensions.regular),
                  ),
                  const SizedBox(height: Dimensions.mediumHalved),
                  const Text(
                    'Landline',
                    style: TextStyle(
                      fontSize: Dimensions.regular,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    landline,
                    style: const TextStyle(fontSize: Dimensions.regular),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    email,
                    style: const TextStyle(fontSize: Dimensions.regular),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Cell',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    cell,
                    style: const TextStyle(fontSize: Dimensions.regular),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Flexible(
          fit: FlexFit.tight,
          child: Container(
            height: 350,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(20), // Adjust border radius as needed
              border: Border.all(color: Colors.blue), // Blue border
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: latLng,
                  zoom: 15,
                ),
                markers: <Marker>{
                  Marker(
                    markerId: MarkerId(branchName),
                    position: latLng,
                  ),
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

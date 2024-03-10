// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

  Branch.headOffice({Key? key})
      : this(
          key: key,
          branchName: 'Head Office',
          address:
              'Office 106,108 & 109 1st Floor \nPrince\'s Flats, Fort Street & 9th Ave\nBulawayo',
          landline: '0292260274/5\n0292272218',
          email: 'darnsterfin@gmail.com',
          cell: '0773373867\n0777024405',
          latLng: LatLng(-20.156817, 28.580317),
        );

  Branch.chipinge({Key? key})
      : this(
          key: key,
          branchName: 'Chipinge',
          address: '64 Joubert Street \nOffice 6 Sirda Building\nChipinge',
          landline: '(0227) 272042531',
          email: 'darnsterfin@gmail.com',
          cell: ' 0776180434',
          latLng: LatLng(-20.192788, 32.619779),
        );

  final String branchName;
  final String address;
  final String landline;
  final String email;
  final String cell;
  final LatLng latLng;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                branchName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                address,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Landline',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                landline,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Email',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                email,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Cell',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                cell,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            width: 200,
            height: 200,
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
        ],
      ),
    );
  }
}

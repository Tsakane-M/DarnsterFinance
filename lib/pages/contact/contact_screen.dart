// ignore_for_file: prefer_const_constructors

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../core/color/colors.dart';
import '../../core/theme/app_theme.dart';
import '../../core/util/strings.dart';
import '../../dimensions/dimensions.dart';
import 'branch.dart';

@RoutePage()
class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand, // Expand the Stack to fill the entire viewport
        children: <Widget>[
          Image.asset(
            contactBackgroundImage,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width / 8,
                vertical: Dimensions.medium,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        contactUs,
                        style: Theme.of(context).homeTitleTextStyle.copyWith(
                              color: whiteColor,
                              fontSize: 30,
                            ),
                      ),
                      SizedBox(width: Dimensions.medium),
                      Icon(
                        Icons.phone,
                        color: whiteColor,
                        size: Dimensions.large,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    reachOut,
                    style: TextStyle(
                      fontSize: Dimensions.regular,
                      color: whiteColor,
                    ),
                  ),
                  SizedBox(height: Dimensions.medium),

                  Row(
                    children: <Widget>[
                      Text(
                        branchLocations,
                        style: Theme.of(context).homeTitleTextStyle.copyWith(
                              color: whiteColor,
                              fontSize: Dimensions.large,
                            ),
                      ),
                      SizedBox(width: Dimensions.medium),
                      Icon(
                        Icons.location_on,
                        color: whiteColor,
                        size: Dimensions.large,
                      ),
                    ],
                  ),
                  //Branch Locations
                  Branch.headOffice(),
                  const SizedBox(height: Dimensions.medium),
                  Branch.chipinge(),
                  SizedBox(height: Dimensions.medium),

                  // Contact Form
                  Container(
                    padding: EdgeInsets.all(Dimensions.medium),
                    decoration: BoxDecoration(
                      color: whiteColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          sendUSMessage,
                          style: TextStyle(
                            fontSize: Dimensions.medium,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: Dimensions.medium),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: name,
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: Dimensions.medium),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: email,
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: Dimensions.medium),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: message,
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 5,
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(send),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/util/strings.dart';
import 'branch.dart';

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
                  horizontal: size.width / 8, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'Contact Us',
                        style: Theme.of(context).homeTitleTextStyle.copyWith(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                      ),
                      SizedBox(width: 15),
                      Icon(
                        Icons.phone,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Feel free to reach out to us for any inquiries or assistance. Our team is here to help!',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(height: 20),

                  Row(
                    children: <Widget>[
                      Text(
                        'Branch Locations',
                        style: Theme.of(context).homeTitleTextStyle.copyWith(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                      ),
                      SizedBox(width: 15),
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 25,
                      ),
                    ],
                  ),
                  //Branch Locations
                  Branch.headOffice(),
                  const SizedBox(height: 20),
                  Branch.chipinge(),
                  SizedBox(height: 20),

                  // Contact Form
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Send us a message',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Message',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 5,
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Send'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
  
    );
  }
}

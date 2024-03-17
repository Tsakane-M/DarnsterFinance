import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/smtp_server/gmail.dart';

import '../../core/color/colors.dart';
import '../../core/util/strings.dart';
import '../../dimensions/dimensions.dart';
import 'branch.dart';

@RoutePage()
class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController messageController = TextEditingController();
    return Scaffold(
      backgroundColor: pageBackgroundColor, // Set background color to white
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width / 8,
                vertical: Dimensions.medium,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Center(
                    child: Text(
                      'Get in touch',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: blackColor,
                      ),
                    ),
                  ),

                  const SizedBox(height: Dimensions.medium),

                  const Row(
                    children: <Widget>[
                      SizedBox(width: Dimensions.medium),
                    ],
                  ),
                  //Branch Locations
                  const Branch.headOffice(),
                  const SizedBox(height: Dimensions.medium),
                  const Branch.chipinge(),
                  const SizedBox(height: Dimensions.medium),

                  SizedBox(
                    width: size.width,
                    height: 50,
                  ),

                  // Contact Form

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        sendUSMessage,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: Dimensions.medium),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: name,

                          filled: true, // Fill the background
                          fillColor: Colors.white, // Set white color
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      const SizedBox(height: Dimensions.medium),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: email,

                          filled: true, // Fill the background
                          fillColor: Colors.white, // Set white color
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      const SizedBox(height: Dimensions.medium),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: message,

                          filled: true, // Fill the background
                          fillColor: Colors.white, // Set white color
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        maxLines: 6,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          nameController.clear();
                          emailController.clear();
                          messageController.clear();
                          final SmtpServer smtpServer =
                              gmail('gmail.com', 'password.');

                          final Message message = Message()
                            ..from = const Address(
                                'peetmhlanga@gmail.com', 'Peter Mhlanga')
                            ..recipients.add('darnsterfin@gmail.com')
                            ..subject = 'New Message from Contact Form'
                            ..text = 'Hello,\n\n'
                                'You have received a new message from the online contact form:\n\n'
                                'Name: ${nameController.text}\n'
                                'Email: ${emailController.text}\n'
                                'Message: ${messageController.text}';

                          try {
                            final SendReport sendReport =
                                await send(message, smtpServer);

                            debugPrint('Message sent: $sendReport');
                            const SnackBar(
                              content: Text('Message sent successfully'),
                            );
                          } catch (e) {
                            debugPrint('Error occurred: $e');
                          }
                        },
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                              const Size(200, 50)), // Set width and height
                          side: MaterialStateProperty.all(const BorderSide(
                              color: Colors.black)), // Set black border
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(
                              8.0), // Add padding to make the button larger
                          child: Text(
                            submit,
                            style: const TextStyle(
                                fontSize: 18), // Adjust font size as needed
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 400,
              width: size.width,
              color: whiteColor, // Adjust the background color as needed

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Insert your website logo here
                  Image.asset(
                    darnsterFinanceLogo,
                    height: 150, // Adjust the height as needed
                  ),

                  const SizedBox(height: 80),
                  const Text(
                    '© 2024 Darnster Finance. All rights reserved.',
                    style: TextStyle(color: nuetralColor, fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

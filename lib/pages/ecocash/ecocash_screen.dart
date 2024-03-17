import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/utils/on_hover.dart';
import '../../components/image/safe_network_image.dart';
import '../../core/util/strings.dart';

@RoutePage()
class EcocashScreen extends StatelessWidget {
  const EcocashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        padding:
            EdgeInsets.symmetric(horizontal: size.width / 20, vertical: 10),
        children: <Widget>[
          Center(
            child: Hero(
              transitionOnUserGestures: true,
              tag: ecocash,
              child: SafeNetworkImage(
                width: 300,
                height: 80,
                imageUrl: ecocashImage,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          const Center(
            child: Text(
              'EcoCash is a mobile payment platform that enables users to conduct various financial transactions using their mobile phones. It was launched by Econet Wireless, a leading telecommunications provider in Zimbabwe. EcoCash has become one of the most popular mobile money services in Zimbabwe, offering convenience, security, and accessibility to a wide range of financial services.\n',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const Center(
            child: Text(
              'Services',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              '• Cash  In \n'
              '• Cash Out. \n',
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ),
          GestureDetector(
            onTap: () {
              launchUrl(Uri.parse('https://www.ecocash.co.zw/'));
            },
            child: Center(
              child: OnHover(
                builder: (BuildContext context, bool isHovered) {
                  final TextStyle textStyle = TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    decoration: isHovered
                        ? TextDecoration.underline
                        : TextDecoration.none,
                  );
                  return Text(
                    'For more information visit: https://www.ecocash.co.zw/',
                    style: textStyle,
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () {
          context.router.pop();
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}

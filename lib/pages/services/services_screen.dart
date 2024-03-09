import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ServicesScreen extends StatelessWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Services'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width / 8, vertical: 10),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            ServiceCard(
              title: 'Microloans',
              description:
                  'Access small loans to support your business or personal needs with flexible repayment terms.',
              icon: Icons.attach_money,
            ),
            ServiceCard(
              title: 'Savings Accounts',
              description:
                  'Start saving with us and enjoy competitive interest rates on your savings.',
              icon: Icons.account_balance_wallet,
            ),
            ServiceCard(
              title: 'Financial Education',
              description:
                  'Learn about financial management and entrepreneurship through our educational programs.',
              icon: Icons.school,
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const ServiceCard({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 40, color: Theme.of(context).primaryColor),
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

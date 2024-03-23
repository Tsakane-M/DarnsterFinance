import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/util/strings.dart';

@RoutePage()
class BusinessLoansScreen extends StatelessWidget {
  const BusinessLoansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding:
            EdgeInsets.symmetric(horizontal: size.width / 20, vertical: 10),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[Color(0xFF8B1813), Color(0xFFBB1716)],
          ),
        ),
        child: ListView(
          children: <Widget>[
            Center(
              child: Hero(
                tag: businessLoans,
                transitionOnUserGestures: true,
                child: Image.asset(
                  businessLoansCleanImage,
                  height: 100,
                  width: 500,
                  fit: BoxFit.contain,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            const Center(
              child: Text(
                'Business loans are financial instruments designed specifically for businesses to borrow money to fund various aspects of their operations. These loans can help businesses manage cash flow, invest in growth opportunities, purchase equipment or inventory, cover operating expenses, and more.\n',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const Center(
              child: Text(
                'Requirements:',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                '• Collateral Security Required \n'
                ' - should be at least two (2) to (3) times the value of the loan. \n'
                ' - to be viewed and serial numbers confirmed \n'
                ' - Affidavit required\n\n'
                '• 3 Months Current Bank Statement\n\n'
                '• Proof of Residence (Water Bill, Edgars, Topics, Truworths, Lease Agreements)\n\n'
                '• Copy of I.D. Card\n\n',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 68, 3, 37),
        onPressed: () {
          context.router.pop();
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}

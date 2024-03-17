import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../components/image/safe_network_image.dart';
import '../../core/util/strings.dart';

@RoutePage()
class PersonalLoansScreen extends StatelessWidget {
  const PersonalLoansScreen({Key? key}) : super(key: key);

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
            colors: <Color>[Color(0xFF252B5F), Color(0xFF13132B)],
          ),
        ),
        child: ListView(
          children: <Widget>[
            Center(
              child: Hero(
                transitionOnUserGestures: true,
                tag: personalLoans,
                child: SafeNetworkImage(
                  width: 500,
                  height: 100,
                  imageUrl: personalLoansCleanImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            const Center(
              child: Text(
                'Personal loans are a type of unsecured loan that individuals can take out. Unlike secured loans, such as a mortgage or auto loan where the borrower puts up collateral (like a house or car), personal loans are not backed by collateral. Instead, the company will rely on the borrower\'s creditworthiness and income to determine eligibility and set the loan terms.\n',
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
                '• Copy of I.D. Card\n\n'
                '• 2 Payslips (Current and Previous)\n\n'
                '• 3 Months Current Bank Statement\n\n'
                '• Confirmation Letter from Employer\n\n'
                '• Proof of Residence (Water Bill, Edgars, \n   Topics or Truworths, Lease Agreements)\n\n'
                '• Collateral security might be required',
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
        onPressed: () {
          context.router.pop();
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}

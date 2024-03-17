import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../components/image/safe_network_image.dart';

import '../../core/util/strings.dart';

@RoutePage()
class AssetBasedLoansScreen extends StatelessWidget {
  const AssetBasedLoansScreen({super.key});

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
              tag: assetBasedLoans,
              transitionOnUserGestures: true,
              child: SafeNetworkImage(
                width: 500,
                height: 100,
                imageUrl: assetBasedLoansCleanImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          const Center(
            child: Text(
              'Asset-based loans are a type of financing where a borrower secures a loan by using assets as collateral. These loans are typically used by businesses that have valuable assets such as inventory, equipment, accounts receivable, or real estate. The lender evaluates the value of these assets and offers a loan based on a percentage of that value.',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              'Requirements:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
              style: TextStyle(fontSize: 20),
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

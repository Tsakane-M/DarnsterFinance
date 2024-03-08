import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Welcome to Our Microfinance Company!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'Empowering Communities Through Financial Inclusion',
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Add navigation to loan application page
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => LoanApplicationPage()));
                },
                child: const Text('Apply for a Loan'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add navigation to services or products page
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => ServicesPage()));
                },
                child: const Text('Our Services'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Note: Replace the comments with actual navigation to other pages or screens as needed.


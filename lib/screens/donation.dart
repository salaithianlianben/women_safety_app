import 'package:flutter/material.dart';

class Donation extends StatefulWidget {
  Donation({Key? key}) : super(key: key);

  @override
  State<Donation> createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(child: Text("Donation Page"),)
    );
  }
}
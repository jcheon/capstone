import 'package:cc_app/screens/home/components/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cc_app/screens/home/components/home_screen.dart';
import 'package:cc_app/screens/home/components/authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return either home or auth widget
    // return HomeScreen();
    return Authenticate();
  }
}

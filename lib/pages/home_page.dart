import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_signin_button/button_builder.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(fontSize: 13),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
          ),
          Container(
            child: SignInButtonBuilder(
              icon: Icons.person_add,
              backgroundColor: Colors.green.shade200,
              text: 'Registration',
              onPressed: () => Get.toNamed('/registration'),
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
          ),
          Container(
            child: SignInButtonBuilder(
              icon: Icons.person_add,
              backgroundColor: Colors.red.shade300,
              text: 'Sign In',
              onPressed: () => Get.toNamed('/loginpage'),
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
          )
        ],
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? userId;

  Future<void> signInWithEmailAndPassword() async {
    try {
      final User? user = (await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ))
          .user;
      Get.snackbar('Hola', 'Se ingreso correctamente');
      print('${user!.email} signed in');
      Future.delayed(Duration(seconds: 1), () {
        userId = user.uid;
        Get.toNamed('/mainpage?userId=${user.uid}');
      });
    } catch (e) {
      Get.snackbar('Fallo', 'NO se pudo ingresar',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> _signOut() async {
    await _auth.signOut();
  }

  void signOut() async {
    final User? user = await _auth.currentUser;
    if (user == null) {
      Get.snackbar('Out', " No one has signed in",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    _signOut();
    final String uid = user.uid;
    Get.snackbar('Out', uid + " has succesfully signed out",
        snackPosition: SnackPosition.BOTTOM);
    Get.offAllNamed('/home');
  }
}

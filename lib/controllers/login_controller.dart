import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginController extends GetxController {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signInWithEmailAndPassword() async {
    try {
      final User? user = (await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ))

          .user;
      Get.snackbar('hola', 'Su ingreso ha sido Exitoso');
      Future.delayed(
        Duration(seconds: 1),
        () {
          Get.toNamed('/home');
        },
      );
    } catch (e) {
      Get.snackbar('fallo', 'no puede ingresar, revise',
          snackPosition: SnackPosition.BOTTOM);
    }
  }


  void _signOut() async {
    await _auth.signOut();
  }

  void signOut() async {
    final User? user = await _auth.currentUser;
    if (user == null) {
      return;
    }
    _signOut();
    final String uid = user.uid;
    Get.toNamed('/login');
  }
}
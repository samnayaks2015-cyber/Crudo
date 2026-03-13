import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController phoneController = TextEditingController();

  void sendOtp(){

    FirebaseAuth.instance.verifyPhoneNumber(

      phoneNumber: "+91${phoneController.text}",

      verificationCompleted: (PhoneAuthCredential credential) async {

        await FirebaseAuth.instance.signInWithCredential(credential);

      },

      verificationFailed: (FirebaseAuthException e) {

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message!)));

      },

      codeSent: (verificationId, resendToken) {

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpScreen(verificationId),
          ),
        );

      },

      codeAutoRetrievalTimeout: (verificationId) {},

    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Image.asset(
              "assets/images/logo.png",
              height:100,
            ),

            const SizedBox(height:30),

            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: "Enter Mobile Number",
              ),
            ),

            const SizedBox(height:20),

            ElevatedButton(
              onPressed: sendOtp,
              child: const Text("SEND OTP"),
            )

          ],
        ),
      ),

    );

  }
}

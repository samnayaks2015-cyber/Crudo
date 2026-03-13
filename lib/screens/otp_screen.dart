import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';

class OtpScreen extends StatefulWidget {

  final String verificationId;

  const OtpScreen(this.verificationId,{super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  TextEditingController otpController = TextEditingController();

  void verifyOtp() async {

    PhoneAuthCredential credential = PhoneAuthProvider.credential(

      verificationId: widget.verificationId,
      smsCode: otpController.text,

    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context)=>const HomeScreen()),
    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: const Text("Verify OTP")),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Enter OTP",
              ),
            ),

            const SizedBox(height:20),

            ElevatedButton(
              onPressed: verifyOtp,
              child: const Text("VERIFY"),
            )

          ],
        ),
      ),

    );

  }
}

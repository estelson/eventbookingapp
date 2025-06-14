import 'package:eventbookingapp/services/auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              /// Screen image
              Image.asset("assets/images/onboarding.png"),

              const SizedBox(height: 10),

              /// 'Unlock the future of' title
              const Text(
                "Unlock the future of",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              /// 'Event Booking App' title
              const Text(
                "Event Booking App",
                style: TextStyle(
                  color: Color(0xff6351ec),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              /// Description
              const Text(
                "Discover, book and experience unforgettable moments effortlessly!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 50),

              /// SignIn with Google button
              GestureDetector(
                onTap: () {
                  AuthMethods().signInWithGoogle(context);
                },
                child: Container(
                  height: 70,
                  margin: const EdgeInsets.only(left: 30, right: 30),
                  decoration: const BoxDecoration(
                    color: Color(0xff6351ec),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// Google logo
                      Image.asset(
                        "assets/images/google.png",
                        height: 30,
                        width: 30,
                        fit: BoxFit.cover,
                      ),

                      const SizedBox(width: 20),

                      /// Button text
                      const Text(
                        "Sign in with Google",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // ✅ ADD THIS
import 'package:goolez/screens/loginpage.dart';
import 'package:goolez/widgets/Textfieldwidget.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// BACKGROUND COLORS
          Align(
            alignment: AlignmentDirectional(0, -0.8),
            child: Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(color: Colors.pink),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0, 0.8),
            child: Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(color: Colors.green),
            ),
          ),

          /// BLUR EFFECT
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 120, sigmaY: 120),
            child: Container(color: Colors.transparent),
          ),

          /// MAIN CARD
          Center(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(25),
                margin: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// HEADER
                    Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),

                    /// FULL NAME FIELD
                    buildTextField(
                      'Full Name',
                      Icons.person,
                      controller: _nameController,
                    ),
                    SizedBox(height: 15),

                    /// EMAIL FIELD
                    buildTextField(
                      'Email',
                      Icons.email,
                      controller: _emailController,
                    ),
                    SizedBox(height: 15),

                    /// PASSWORD FIELD
                    buildTextField(
                      'Password',
                      Icons.lock,
                      obscure: true,
                      controller: _passwordController,
                    ),
                    SizedBox(height: 25),

                    /// REGISTER BUTTON
                    GestureDetector(
                      onTap: () async {
                        String name = _nameController.text.trim();
                        String email = _emailController.text.trim();
                        String password = _passwordController.text.trim();

                        if (name.isEmpty || email.isEmpty || password.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("All fields are required")),
                          );
                          return;
                        }

                        try {
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: email,
                            password: password,
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                Text("Account Created Successfully!")),
                          );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Loginpage()),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.toString())),
                          );
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.deepPurple,
                              Colors.pink,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Center(
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    /// ALREADY HAVE ACCOUNT
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Loginpage(),
                          ),
                        );
                      },
                      child: Text(
                        'Already have an account ? Login',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

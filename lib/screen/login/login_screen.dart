import 'package:blog/config/custom_color.dart';
import 'package:blog/config/text_style.dart';
import 'package:blog/screen/login/register_screen.dart';
import 'package:blog/services/auth_service.dart';
import 'package:blog/widget/custom_button.dart';
import 'package:blog/widget/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String id = "login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signUserIn() async {
    try {
      //loading
      await AuthMethods().loginWithEmail(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Center(
              child: Container(
                width: size.width > 600 ? 600 : size.width,
                height: size.height,
                constraints: BoxConstraints(maxHeight: size.height),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //form login
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: RichText(
                            text: TextSpan(
                                text: 'Welcome back!\n',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold,
                                    color: mainTextColor,
                                    fontSize: 25),
                                children: [
                                  TextSpan(
                                    text: 'Please sign in to your account',
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.normal,
                                        color: mainTextColor,
                                        fontSize: 15),
                                  )
                                ]),
                          ),
                        ),
                        //email textfield
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: MyTextField(
                                  height: 50,
                                  width: 300,
                                  text: "Email",
                                  lableStyle: GoogleFonts.nunitoSans(
                                    color: unselectedTextColor,
                                    fontSize: 16,
                                  ),
                                  icon: const Icon(
                                    FontAwesomeIcons.solidEnvelope,
                                    color: unselectedTextColor,
                                    size: 18,
                                  ),
                                  controller: emailController,
                                  radius: 15,
                                  isPass: false,
                                ),
                              ),
                              //password textfield
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: MyTextField(
                                  height: 50,
                                  width: 300,
                                  text: "Password",
                                  lableStyle: GoogleFonts.nunitoSans(
                                    color: unselectedTextColor,
                                    fontSize: 16,
                                  ),
                                  icon: const Icon(
                                    FontAwesomeIcons.lock,
                                    color: unselectedTextColor,
                                    size: 18,
                                  ),
                                  controller: passwordController,
                                  radius: 15,
                                  isPass: true,
                                ),
                              ),
                              //forget password
                              Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Forgot password',
                                      style: GoogleFonts.nunitoSans(
                                          color: mainTextColor,
                                          fontSize: 15,
                                          decorationColor: Colors.black,
                                          decorationStyle:
                                              TextDecorationStyle.solid,
                                          decoration: TextDecoration.underline),
                                    ),
                                  )),
                              // button sign in
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Center(
                                    child: MyButton(
                                  color: kPrimaryColor,
                                  title: 'Sign in',
                                  ontap: () {
                                    signUserIn();
                                  },
                                  width: 300,
                                  height: 70,
                                )),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Text(
                            'Or',
                            style: bodyText,
                          ),
                        ),
                        //google button
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: MyButton(
                                ontap: () {},
                                height: 70,
                                width: 300,
                                color: Colors.white,
                                title: 'Sign in with Google',
                                icon: Image.asset('assets/images/google.png')),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: GoogleFonts.nunitoSans(
                                  decorationColor: mainTextColor,
                                  color: mainTextColor,
                                  fontSize: 15),
                            ),
                            //register
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RegisterScreen.id);
                                },
                                child: Text(
                                  " Sign Up for free",
                                  style: GoogleFonts.nunitoSans(
                                      color: kPrimaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:blog/config/custom_color.dart';
import 'package:blog/config/text_style.dart';
import 'package:blog/screen/login/login_screen.dart';
import 'package:blog/widget/custom_button.dart';
import 'package:blog/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String id = "register";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: RichText(
                          text: TextSpan(
                              text: 'Create new account\n',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  color: mainTextColor,
                                  fontSize: 25),
                              children: [
                                TextSpan(
                                  text: 'Please fill in the form to continue',
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.normal,
                                      color: mainTextColor,
                                      fontSize: 15),
                                )
                              ]),
                        ),
                      ),
                      //form register
                      Column(
                        children: [
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
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: MyTextField(
                                    height: 50,
                                    width: 300,
                                    text: "Confirm password",
                                    lableStyle: GoogleFonts.nunitoSans(
                                      color: unselectedTextColor,
                                      fontSize: 16,
                                    ),
                                    controller: confirmPassController,
                                    icon: const Icon(
                                      FontAwesomeIcons.lock,
                                      color: unselectedTextColor,
                                      size: 18,
                                    ),
                                    radius: 15,
                                    isPass: true,
                                  ),
                                ),
                                // button sign in
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Center(
                                      child: MyButton(
                                    width: 300,
                                    height: 70,
                                    title: 'Sign Up',
                                    color: kPrimaryColor,
                                    ontap: () {
                                      //       _registerUser();
                                    },
                                  )),
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
                                        icon: Image.asset(
                                            'assets/images/google.png')),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "If you have an account ,",
                                style: bodyText,
                              ),
                              //register
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen()));
                                  },
                                  child: Text(
                                    "Sign in",
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
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

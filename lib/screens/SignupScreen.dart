import 'package:flutter/material.dart';
import 'package:midterm_project/screens/Dashboard.dart';
import 'package:midterm_project/screens/LoginScreen.dart';
import 'package:midterm_project/widget/PrimaryButton.dart';
import '../widget/CustomTextField.dart';
import '../widget/PasswordField.dart';

class SignupScreen extends StatefulWidget {
  static String routeName = "/signup";
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool obscurePassword1 = true;
  bool obscurePassword2 = true;
  String validationMsg = "";

  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: const AssetImage("assets/signup_scrn.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.dstATop),
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    width: width * .9,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                labelText: "First Name",
                                hintText: "Enter First Name",
                                controller: fnameController,
                                textInputType: TextInputType.text,
                              ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: CustomTextField(
                                labelText: "Last Name",
                                hintText: "Enter Last Name",
                                controller: lnameController,
                                textInputType: TextInputType.text,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        CustomTextField(
                          labelText: "Email Address",
                          hintText: "Enter Email Address",
                          controller: emailController,
                          textInputType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        PasswordField(
                            labelText: "Password",
                            hintText: "Enter Password",
                            obscureText: obscurePassword1,
                            onTap: handleObscurePassword1,
                            controller: passwordController),
                        const SizedBox(
                          height: 20.0,
                        ),
                        PasswordField(
                            labelText: "Confirm Password",
                            hintText: "Enter Password",
                            obscureText: obscurePassword2,
                            onTap: handleObscurePassword2,
                            controller: confirmpasswordController),
                        const SizedBox(
                          height: 20.0,
                        ),
                        PrimaryButton(
                          text: "Signup",
                          iconData: Icons.app_registration,
                          onPress: () {
                            if (fnameController.text == "" ||
                                lnameController.text == "" ||
                                emailController.text == "" ||
                                passwordController.text == "" ||
                                confirmpasswordController.text == "") {
                              setState(() {
                                validationMsg = "Fill up the required fields";
                              });
                            } else if (!emailController.text.contains("@") ||
                                !emailController.text.contains(".com")) {
                              setState(() {
                                validationMsg = "Enter a valid email";
                              });
                            } else if (passwordController.text !=
                                confirmpasswordController.text) {
                              setState(() {
                                validationMsg =
                                    "Password mismatch. Please try again";
                              });
                            } else {
                              Navigator.pushReplacementNamed(
                                  context, LoginScreen.routeName);
                            }
                          },
                        ),
                        Container(
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, LoginScreen.routeName);
                              },
                              child: const Text(
                                "Already have an account? Log in here.",
                                style: TextStyle(
                                    color: Colors.white,
                                    height: 2,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 150,
              child: Text(
                validationMsg,
                style: const TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 248, 7, 7)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  handleObscurePassword1() {
    setState(() {
      obscurePassword1 = !obscurePassword1;
    });
  }

  handleObscurePassword2() {
    setState(() {
      obscurePassword2 = !obscurePassword2;
    });
  }
}

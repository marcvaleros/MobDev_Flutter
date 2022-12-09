import 'package:flutter/material.dart';
import 'package:midterm_project/screens/Dashboard.dart';
import 'package:midterm_project/screens/SignupScreen.dart';
import 'package:midterm_project/widget/PrimaryButton.dart';
import '../widget/CustomTextField.dart';
import '../widget/PasswordField.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Welcome to MNV "),
      // ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: const AssetImage("assets/sumeru.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop),
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                width: width * .9,
                child: Column(
                  children: [
                    CustomTextField(
                        labelText: "Email Address",
                        hintText: "Enter Email Address",
                        controller: emailController,
                        textInputType: TextInputType.emailAddress),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PasswordField(
                        labelText: "Password",
                        hintText: "Enter Password",
                        obscureText: obscurePassword,
                        onTap: handleObscurePassword,
                        controller: passwordController),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PrimaryButton(
                      text: "Login",
                      iconData: Icons.login,
                      onPress: () {
                        Navigator.pushReplacementNamed(
                            context, Dashboard.routeName,
                            arguments: LoginCredentials(emailController.text));
                      },
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, SignupScreen.routeName);
                        },
                        child: const Text(
                          "Don't have an account? Sign up here.",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              height: 2,
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
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
    );
  }

  handleObscurePassword() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }
}

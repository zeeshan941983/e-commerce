import 'package:amazon/common/widgets/custom_button.dart';
import 'package:amazon/common/widgets/custom_textfield.dart';
import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup; // Start with Sign Up section visible
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final bool isture = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
    );
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVaribales.purpulecus,
      body: Stack(
        children: [
          Image.network(
            "https://sendbird.imgix.net/cms/20230621_Tips-for-developing-a-successful-ecommerce-app-blog-cover.png?auto=format,compress&crop=faces",
            fit: BoxFit.fitHeight,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Welcome\n Back!',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff4A44AB))),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _auth = Auth.signup;
                          });
                        },
                        child: Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: _auth == Auth.signup
                                  ? Color(0xff4A44AB)
                                  : GlobalVaribales.purpulecus),
                          child: Center(
                            child: Text(
                              'Create Account',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: _auth == Auth.signup
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: _auth == Auth.signup ? 17 : 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _auth = Auth.signin;
                          });
                        },
                        child: Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: _auth == Auth.signin
                                  ? Color(0xff4A44AB)
                                  : GlobalVaribales.purpulecus),
                          child: Center(
                            child: Text(
                              'Sign-In',
                              style: TextStyle(
                                fontSize: _auth == Auth.signin ? 17 : 14,
                                fontWeight: FontWeight.bold,
                                color: _auth == Auth.signin
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (_auth == Auth.signup)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      decoration: const BoxDecoration(
                        color: GlobalVaribales.purpulecus,
                      ),
                      child: Form(
                        key: _signUpFormKey,
                        child: Column(
                          children: [
                            CustomTextfield(
                              controller: _nameController,
                              hint: 'Name',
                            ),
                            const SizedBox(height: 10),
                            CustomTextfield(
                              controller: _emailController,
                              hint: 'Email',
                            ),
                            const SizedBox(height: 10),
                            CustomTextfield(
                              controller: _passwordController,
                              hint: 'Password',
                            ),
                            const SizedBox(height: 20),
                            Custom_button(
                              color: Color(0xff4A44AB),
                              text: 'Sign Up',
                              size: 16,
                              ontap: () {
                                if (_signUpFormKey.currentState!.validate()) {
                                  signUpUser();
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  if (_auth == Auth.signin)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      decoration: const BoxDecoration(
                        color: GlobalVaribales.purpulecus,
                      ),
                      child: Form(
                        key: _signInFormKey,
                        child: Column(
                          children: [
                            CustomTextfield(
                              controller: _emailController,
                              hint: 'Email',
                            ),
                            const SizedBox(height: 15),
                            CustomTextfield(
                              controller: _passwordController,
                              hint: 'Password',
                            ),
                            const SizedBox(height: 20),
                            Custom_button(
                              color: Color(0xff4A44AB),
                              text: 'Sign In',
                              size: 16,
                              ontap: () {
                                if (_signInFormKey.currentState!.validate()) {
                                  signInUser();
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/pages/home_page.dart';
import 'package:recipe_app/services/perefrene_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  late GlobalKey<FormState> formKey;

  bool obsecureText = true;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  void toggleObsecure() {
    obsecureText = !obsecureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(

         body:
         Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/main_photo.png"), fit:BoxFit.fill )),
           child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                   child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Image.asset("assets/images/Logo (1).png"),
                        TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            decoration: const InputDecoration(
                              label: Text('Email'),
                              suffixIcon: Icon(Icons.email),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'email is required';
                              }

                              if (!EmailValidator.validate(value)) {
                                return 'Not Valid Email';
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                            obscureText: obsecureText,
                            controller: passwordController,
                            decoration: InputDecoration(
                                label: const Text('Password'),
                                suffixIcon: InkWell(
                                  onTap: () => toggleObsecure(),
                                  child: Icon(obsecureText
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                )),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'password is required';
                              }

                              if (value.length < 6) {
                                return 'password too short';
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor:Colors.orange),
                            onPressed: () async {
                              if (formKey.currentState?.validate() ?? false) {
                                await PrefrencesService.prefs?.setBool('isLogin', true);

                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (_) => HomePage()));
                              }
                            },
                            child: const Text('Sign in'))
                      ],
                    ),

                ),
      ))));





  }
}
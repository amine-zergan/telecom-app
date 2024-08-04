import 'package:flutter/material.dart';
import 'package:telecom/helpers/validators/profil/profile_validator.dart';
import 'package:telecom/view/pages/home/views/auth_pages/signin_page/components/signInTextFieldComponent.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final GlobalKey<FormState> formStateSignIn = GlobalKey<FormState>();
  late TextEditingController passwordTextFieldController;
  late TextEditingController emailTextFieldController;
  bool isObscure = true;

  @override
  void initState() {
    passwordTextFieldController = TextEditingController();
    emailTextFieldController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: size.height * 0.8,
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Bonjour\nConnectez-vous!',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontFamily: 'DINForm',
                      fontWeight: FontWeight.w700,
                    ),
              ),
              SizedBox(height: 30),
              Form(
                key: formStateSignIn,
                child: Column(
                  children: [
            
  SignInTextFieldComponent(
                   
                      label: 'Email',
                      hint: 'Taper votre Email ici.',
                      isObscure: isObscure,
                      controller: emailTextFieldController,
              
                      validate: (String? value) {
                        return ValidatorProfile.validatorEmail(
                            value, );
                      },
                    ),

                    SizedBox(
                      height: 15,
                    ),
                    SignInTextFieldComponent(
                      onToggle: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      label: 'Mot de passe',
                      hint: 'Taper votre mot de passe ici.',
                      isObscure: isObscure,
                      controller: passwordTextFieldController,
                      icon: isObscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      validate: (String? value) {
                        return ValidatorProfile.validatorPassword(
                            value, context);
                      },
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'mot de passe oublié ?',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.grey.shade700),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                      onPressed: () async {
                                            if (formStateSignIn.currentState!
                                                .validate()) {
                                              print(
                                                  'Formulaire validé avec succès.');
                                              
                                            }
                                          },
                      elevation: 0,
                      color: Colors.black,
                      minWidth: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        "Connexion",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.white,
                                ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Vous n'avez pas de compte ?",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.grey.shade700),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            "s'inscrire.",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.red),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

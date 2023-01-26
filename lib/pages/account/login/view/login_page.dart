// ignore_for_file: unnecessary_lambdas

import 'package:astros_app/consts/colors.dart';
import 'package:astros_app/pages/account/register/view/register_page.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVisible = false, isLoading = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String errorPassword = '';
  String errorEmail = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: backgroundNeutralColor,
            ),
          ),
          Positioned(
            right: -60,
            child: Container(
              width: 400,
              height: 400,
              decoration: const BoxDecoration(
                color: gradientCircleColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            left: -90,
            bottom: 0,
            child: Container(
              width: 600,
              height: 600,
              decoration: const BoxDecoration(
                color: gradientCircleColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          BlurryContainer(
            blur: 40,
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: ListView(
                children: [
                  SizedBox(
                    height: 100,
                    child: Image.asset(
                      'assets/icons/logoLevaAstrosAzul.png',
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 40),
                    child: Text(
                      'Bem-vindo ao seu app de \ncontratação de músicos',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(
                        color: headingBlueColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Email',
                          style: GoogleFonts.outfit(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 56,
                        child: TextFormField(
                          controller: email,
                          cursorColor: iconsColor,
                          autofillHints: const [AutofillHints.email],
                          decoration: InputDecoration(
                            hintText: 'seuemail@email.com.br',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                width: 2,
                                color: iconsColor,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: iconsColor,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Senha',
                            style: GoogleFonts.outfit(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 56,
                          child: TextFormField(
                            controller: password,
                            cursorColor: iconsColor,
                            obscureText: !isVisible,
                            obscuringCharacter: '*',
                            autofillHints: const [AutofillHints.password],
                            decoration: InputDecoration(
                              hintText: '**********************',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                                icon: Icon(
                                  isVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: iconsColor.withOpacity(0.5),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: iconsColor,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  color: iconsColor,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (!isLoading) {
                        setState(() {
                          isLoading = true;
                        });
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 30),
                      width: double.maxFinite,
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              'Entrar',
                              style: GoogleFonts.outfit(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.off(() => const RegisterPage());
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 20),
                      child: Text(
                        'Ainda não tem conta? Cadastre-se',
                        style: GoogleFonts.outfit(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('object');
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: double.maxFinite,
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //! Trocar ícone para o SVG no layout
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: const Icon(
                              FontAwesomeIcons.google,
                              size: 30,
                            ),
                          ),
                          Text(
                            'Continuar com Google',
                            style: GoogleFonts.outfit(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('object');
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: double.maxFinite,
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //! Trocar ícone para o SVG no layout
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: const Icon(
                              FontAwesomeIcons.squareFacebook,
                              size: 30,
                            ),
                          ),
                          Text(
                            'Continuar com Facebook',
                            style: GoogleFonts.outfit(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

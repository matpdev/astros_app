// ignore_for_file: unnecessary_lambdas, inference_failure_on_function_return_type, prefer_final_locals, omit_local_variable_types

import 'package:astros_app/consts/colors.dart';
import 'package:astros_app/widgets/widgets.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchAroundPage extends StatefulWidget {
  const SearchAroundPage({super.key});

  @override
  State<SearchAroundPage> createState() => _SearchAroundPageState();
}

class _SearchAroundPageState extends State<SearchAroundPage> {
  bool isVisible = false, isLoading = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController start = TextEditingController();
  TextEditingController end = TextEditingController();
  String errorPassword = '';
  String errorEmail = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBarCustom(),
      extendBody: true,
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
            child: SizedBox(
              width: double.maxFinite,
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Músicos Próximos',
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        //! Colocar Mapa
                        const Icon(FontAwesomeIcons.mapLocationDot)
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                    ),
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                'Distância Inicial',
                                style: GoogleFonts.outfit(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              child: TextFormField(
                                cursorColor: iconsColor,
                                controller: start,
                                textAlignVertical: TextAlignVertical.center,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
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
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                'Distância Final',
                                style: GoogleFonts.outfit(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              child: TextFormField(
                                controller: end,
                                cursorColor: iconsColor,
                                textAlignVertical: TextAlignVertical.center,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
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
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const RecomendationContainer(),
                  const RecomendationContainer(),
                  const RecomendationContainer(),
                  const RecomendationContainer(),
                  const RecomendationContainer(),
                  const RecomendationContainer(),
                  const RecomendationContainer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

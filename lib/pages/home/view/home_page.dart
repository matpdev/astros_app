// ignore_for_file: unnecessary_lambdas, inference_failure_on_function_return_type, prefer_final_locals, omit_local_variable_types

import 'package:astros_app/consts/colors.dart';
import 'package:astros_app/globalController/user_controller.dart';
import 'package:astros_app/pages/home/screen/search_around_page.dart';
import 'package:astros_app/widgets/widgets.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isVisible = false, isLoading = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String errorPassword = '';
  String errorEmail = '';

  final userData = Get.put<UserController>(UserController());

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
                          'Olá, José',
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.pin_drop),
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Text(
                                'São Paulo',
                                style: GoogleFonts.outfit(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.to(() => const SearchAroundPage()),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.symmetric(vertical: 25),
                      child: const ButtonCustom(),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, bottom: 10),
                    child: Text(
                      'Categorias',
                      style: GoogleFonts.outfit(
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                        color: headingGreyColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: const [
                        IconCategories(
                          iconPath: 'assets/icons/forroIcon.png',
                          typeCategorie: 'Forró',
                          iconCenterPath:
                              'assets/icons/instrumentForroIcon.png',
                        ),
                        IconCategories(
                          iconPath: 'assets/icons/forroIcon.png',
                          typeCategorie: 'Forró',
                          iconCenterPath:
                              'assets/icons/instrumentForroIcon.png',
                        ),
                        IconCategories(
                          iconPath: 'assets/icons/forroIcon.png',
                          typeCategorie: 'Forró',
                          iconCenterPath:
                              'assets/icons/instrumentForroIcon.png',
                        ),
                        IconCategories(
                          iconPath: 'assets/icons/forroIcon.png',
                          typeCategorie: 'Forró',
                          iconCenterPath:
                              'assets/icons/instrumentForroIcon.png',
                        ),
                        IconCategories(
                          iconPath: 'assets/icons/forroIcon.png',
                          typeCategorie: 'Forró',
                          iconCenterPath:
                              'assets/icons/instrumentForroIcon.png',
                        ),
                        IconCategories(
                          iconPath: 'assets/icons/forroIcon.png',
                          typeCategorie: 'Forró',
                          iconCenterPath:
                              'assets/icons/instrumentForroIcon.png',
                        ),
                        IconCategories(
                          iconPath: 'assets/icons/forroIcon.png',
                          typeCategorie: 'Forró',
                          iconCenterPath:
                              'assets/icons/instrumentForroIcon.png',
                        ),
                        IconCategories(
                          iconPath: 'assets/icons/forroIcon.png',
                          typeCategorie: 'Forró',
                          iconCenterPath:
                              'assets/icons/instrumentForroIcon.png',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 136,
                    child: ListView(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: const [
                        EmphasisContainer(),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                      bottom: 10,
                      top: 10,
                    ),
                    child: Text(
                      'Recomendações para você',
                      style: GoogleFonts.outfit(
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                        color: headingGreyColor,
                      ),
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

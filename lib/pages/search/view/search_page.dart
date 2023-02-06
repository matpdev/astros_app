// ignore_for_file: unnecessary_lambdas, inference_failure_on_function_return_type, prefer_final_locals, omit_local_variable_types

import 'package:astros_app/consts/colors.dart';
import 'package:astros_app/globalController/user_controller.dart';
import 'package:astros_app/pages/search/screen/searchResult/search_result_page.dart';
import 'package:astros_app/widgets/widgets.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
            padding: EdgeInsets.zero,
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 150),
              child: Column(
                children: [
                  Container(
                    height: 140,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(20),
                        bottomStart: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 48,
                          margin: const EdgeInsets.only(top: 20),
                          child: TextFormField(
                            cursorColor: iconsColor,
                            // controller: start,
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.search,
                                color: iconsColor,
                              ),
                              hintText: 'Buscar por artista ou categoria',
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
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(
                      left: 10,
                      bottom: 10,
                      top: 10,
                    ),
                    child: Text(
                      'Histórico',
                      style: GoogleFonts.outfit(
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                        color: headingGreyColor,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 10,
                      children: [
                        ChipContainer(
                          text: 'Rock',
                          onTap: () {
                            Get.to(() => const SearchResultPage());
                          },
                        ),
                        ChipContainer(
                          text: 'Rock',
                          onTap: () {},
                        ),
                        ChipContainer(
                          text: 'Rock',
                          onTap: () {},
                        ),
                        ChipContainer(
                          text: 'Rock',
                          onTap: () {},
                        ),
                        ChipContainer(
                          text: 'RockRockRock',
                          onTap: () {},
                        ),
                        ChipContainer(
                          text: 'Rock',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(
                      left: 10,
                      bottom: 10,
                      top: 10,
                    ),
                    child: Text(
                      'Sugestões ',
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

class ChipContainer extends StatelessWidget {
  const ChipContainer({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 29,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text ?? '',
              style: GoogleFonts.outfit(
                fontWeight: FontWeight.w300,
                fontSize: 14,
                color: headingGreyColor,
              ),
            ),
            InkWell(
              onTap: onTap,
              child: const Icon(
                Icons.clear,
                color: dangerColor,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

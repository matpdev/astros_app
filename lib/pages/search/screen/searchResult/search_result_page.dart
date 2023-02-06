// ignore_for_file: unnecessary_lambdas, inference_failure_on_function_return_type, prefer_final_locals, omit_local_variable_types

import 'package:astros_app/consts/colors.dart';
import 'package:astros_app/globalController/user_controller.dart';
import 'package:astros_app/widgets/widgets.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({super.key});

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
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
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 50),
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.arrow_back_rounded,
                                    color: iconsColor,
                                    size: 30,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      '"Rock"',
                                      style: GoogleFonts.outfit(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  BottomFilter(context);
                                },
                                child: Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: Text(
                                          'Busca Avançada',
                                          style: GoogleFonts.outfit(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      const Icon(
                                        Icons.filter_list_rounded,
                                        color: iconsColor,
                                        size: 30,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(top: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 20),
                                child: Text(
                                  'Ordenar Por:',
                                  style: GoogleFonts.outfit(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Wrap(
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(left: 5),
                                      decoration: BoxDecoration(
                                        border: Border.all(),
                                      ),
                                      height: 28,
                                      child: FittedBox(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: const [
                                            Text('Valor'),
                                            Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 5),
                                      decoration: BoxDecoration(
                                        border: Border.all(),
                                      ),
                                      height: 28,
                                      child: FittedBox(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: const [
                                            Text('Classificação'),
                                            Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 5),
                                      decoration: BoxDecoration(
                                        border: Border.all(),
                                      ),
                                      height: 28,
                                      child: FittedBox(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: const [
                                            Text('Valor'),
                                            Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                      bottom: 10,
                      top: 10,
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

  Future<dynamic> BottomFilter(BuildContext context) {
    return Get.bottomSheet(
      Container(
        height: MediaQuery.of(context).size.height * 0.9,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'Filtro Avançado',
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Categorias',
                      style: GoogleFonts.outfit(
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                      ),
                      height: 45,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(
                              right: 10,
                            ),
                            padding: const EdgeInsets.all(8),
                            width: 75,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(
                                0x40c8a2c8,
                              ),
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: Text(
                              'Todos',
                              style: GoogleFonts.outfit(
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Estilos',
                      style: GoogleFonts.outfit(
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                      ),
                      height: 45,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(
                              right: 10,
                            ),
                            padding: const EdgeInsets.all(8),
                            width: 75,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(
                                0x40c8a2c8,
                              ),
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: Text(
                              'Todos',
                              style: GoogleFonts.outfit(
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Data'),
                    TextFormField(
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.abc),
                        border: OutlineInputBorder(),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      isScrollControlled: true,
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

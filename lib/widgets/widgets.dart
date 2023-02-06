// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_raw_strings, unnecessary_lambdas

import 'package:astros_app/consts/colors.dart';
import 'package:astros_app/globalController/widgets/bottom_navigation_controller.dart';
import 'package:astros_app/pages/home/view/home_page.dart';
import 'package:astros_app/pages/search/view/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                child: Image.asset('assets/icons/mapIcon.png'),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Encontre músicos próximos',
                      style: GoogleFonts.outfit(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      'Encontre músicos próximos',
                      style: GoogleFonts.outfit(
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
          )
        ],
      ),
    );
  }
}

class IconCategories extends StatelessWidget {
  const IconCategories({
    super.key,
    required this.iconPath,
    required this.typeCategorie,
    required this.iconCenterPath,
  });
  final String iconPath;
  final String typeCategorie;
  final String iconCenterPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(iconPath),
              ),
            ),
            alignment: Alignment.center,
            child: SizedBox(
              width: 30,
              height: 30,
              child: Image.asset(iconCenterPath),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            child: Text(
              typeCategorie,
              style: GoogleFonts.outfit(
                fontWeight: FontWeight.w300,
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BottomBarCustom extends StatefulWidget {
  const BottomBarCustom({super.key});

  @override
  State<BottomBarCustom> createState() => _BottomBarCustomState();
}

class _BottomBarCustomState extends State<BottomBarCustom> {
  final navigationIndex = Get.put<NavigationController>(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      height: 100,
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconBottomBar(
              text: '',
              icon: navigationIndex.indexSelected.value == 0
                  ? Icons.home_rounded
                  : Icons.home_outlined,
              selected: navigationIndex.indexSelected.value == 0 ? true : false,
              onPressed: () {
                if (navigationIndex.indexSelected.value != 0) {
                  setState(() {
                    navigationIndex.setIndex(0);
                    Get.to(() => HomePage());
                  });
                }
              },
            ),
            IconBottomBar(
              text: 'Search',
              icon: navigationIndex.indexSelected.value == 1
                  ? Icons.favorite
                  : Icons.favorite_outline,
              selected: navigationIndex.indexSelected.value == 1 ? true : false,
              onPressed: () {
                if (navigationIndex.indexSelected.value != 1) {
                  setState(() {
                    navigationIndex.setIndex(1);
                  });
                }
              },
            ),
            IconBottomBar2(
              text: 'Home',
              icon: Icons.search_outlined,
              selected: navigationIndex.indexSelected.value == 2 ? true : false,
              onPressed: () {
                if (navigationIndex.indexSelected.value != 2) {
                  setState(() {
                    navigationIndex.setIndex(2);
                    Get.to(() => SearchPage());
                  });
                }
              },
            ),
            IconBottomBar(
              text: 'Cart',
              icon: Icons.local_grocery_store_outlined,
              selected: navigationIndex.indexSelected.value == 3 ? true : false,
              onPressed: () {
                if (navigationIndex.indexSelected.value != 3) {
                  setState(() {
                    navigationIndex.setIndex(3);
                  });
                }
              },
            ),
            IconBottomBar(
              text: 'Calendar',
              icon: Icons.date_range_outlined,
              selected: navigationIndex.indexSelected.value == 4 ? true : false,
              onPressed: () {
                if (navigationIndex.indexSelected.value != 4) {
                  setState(() {
                    navigationIndex.setIndex(4);
                  });
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar({
    super.key,
    required this.text,
    required this.icon,
    required this.selected,
    required this.onPressed,
  });
  final String text;
  final IconData icon;
  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 27,
            color: selected ? backgroundBlueColor : Colors.black54,
          ),
        ),
      ],
    );
  }
}

class IconBottomBar2 extends StatelessWidget {
  const IconBottomBar2({
    super.key,
    required this.text,
    required this.icon,
    required this.selected,
    required this.onPressed,
  });
  final String text;
  final IconData icon;
  final bool selected;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: selected ? primaryColor : backgroundBlueColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: selected
                  ? primaryColor.withOpacity(0.7)
                  : backgroundBlueColor.withOpacity(0.7),
              blurRadius: 20,
            )
          ],
        ),
        child: Icon(
          icon,
          size: 25,
          color: Colors.white,
        ),
      ),
    );
  }
}

class EmphasisContainer extends StatelessWidget {
  const EmphasisContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 224,
      height: 136,
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: NetworkImage(
            'https://nerdhits.com.br/wp-content/uploads/2021/05/solo-leveling-anime-vai-ter-data-1200x720.jpg',
          ),
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0),
                  Colors.black,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Banda Versáteis',
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 3),
                              child: Icon(
                                Icons.star,
                                color: primaryColor,
                                size: 15,
                              ),
                            ),
                            Text(
                              '4,9',
                              style: GoogleFonts.outfit(
                                fontWeight: FontWeight.w300,
                                fontSize: 10,
                                color: headingGreyColor,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 3),
                                child: Icon(
                                  Icons.my_library_music_rounded,
                                  color: primaryColor,
                                  size: 15,
                                ),
                              ),
                              Text(
                                'Rock',
                                style: GoogleFonts.outfit(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 10,
                                  color: headingGreyColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 19,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Text(
                        'R\$ 1.500',
                        style: GoogleFonts.outfit(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: headingBlueColor,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RecomendationContainer extends StatefulWidget {
  const RecomendationContainer({super.key});

  @override
  State<RecomendationContainer> createState() => _RecomendationContainerState();
}

class _RecomendationContainerState extends State<RecomendationContainer> {
  bool isFavorited = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 132,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.only(right: 20),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.star,
                          size: 15,
                          color: Color(0xFFDED500),
                        ),
                      ),
                      Text(
                        '4,9 - Rock - 3,4km',
                        style: GoogleFonts.outfit(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          color: headingGreyColor,
                        ),
                      )
                    ],
                  ),
                  Text(
                    'Banda Expo',
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: headingBlueColor,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Taxa Translado: ',
                            style: GoogleFonts.outfit(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: headingGreyColor,
                            ),
                          ),
                          Text(
                            'R\$ 100',
                            style: GoogleFonts.outfit(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: headingGreyColor,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Cachê: ',
                            style: GoogleFonts.outfit(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: headingBlackColor,
                            ),
                          ),
                          Text(
                            'R\$ 500 à 1.800',
                            style: GoogleFonts.outfit(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: headingBlueColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.pin_drop,
                          size: 15,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Maceió',
                        style: GoogleFonts.outfit(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: headingGreyColor,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isFavorited = !isFavorited;
              });
            },
            icon: Icon(
              isFavorited ? Icons.favorite : Icons.favorite_border_outlined,
              color: isFavorited ? headingBlueColor : Color(0xFFE8E8E8),
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}

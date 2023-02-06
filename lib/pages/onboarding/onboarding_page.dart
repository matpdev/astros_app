import 'package:astros_app/config/size_config.dart';
// import 'package:foodhero_app/constants/colors/colors_pallete.dart';
import 'package:astros_app/models/onboardingModels/onboarding_content.dart';
import 'package:astros_app/pages/home/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _currentPage = 0;

  AnimatedContainer _buildDots({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        color: _currentPage == index
            ? const Color(0xFF69DAD8)
            : const Color(0xFFF7F7F7).withOpacity(0.4),
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final width = SizeConfig.screenW!;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        top: false,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/onboardingBackground.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            color: Colors.black.withOpacity(0.8),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 100),
                  height: 100,
                  child: Image.asset(
                    'assets/icons/logoLevaAstros.png',
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    onPageChanged: (value) => setState(
                      () => _currentPage = value,
                    ),
                    itemCount: contents.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              contents[i].title,
                              style: GoogleFonts.outfit(
                                color: const Color(0xffF4DEB5),
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              contents[i].desc,
                              style: GoogleFonts.outfit(
                                color: const Color(0xFFF7F7F7),
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            contents.length,
                            (int index) => _buildDots(index: index),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width,
                        child: ElevatedButton(
                          onPressed: () async {
                            const storage = FlutterSecureStorage();
                            await storage.write(
                              key: 'isOnboardingRead',
                              value: 'true',
                            );
                            await Get.to(const HomePage());
                            // await Get.to(const LoginPage());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: (width <= 550)
                                ? const EdgeInsets.symmetric(
                                    horizontal: 100,
                                    vertical: 20,
                                  )
                                : EdgeInsets.symmetric(
                                    horizontal: width * 0.2,
                                    vertical: 25,
                                  ),
                            textStyle: TextStyle(
                              fontSize: (width <= 550) ? 13 : 17,
                            ),
                          ),
                          child: const Text('Vamos lá'),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 50, top: 10),
                  child: InkWell(
                    onTap: () => print('object'),
                    child: Text(
                      'Ainda não tem uma conta? Cadastre-se',
                      style: GoogleFonts.outfit(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

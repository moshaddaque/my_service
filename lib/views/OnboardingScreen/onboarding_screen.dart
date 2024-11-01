import 'package:flutter/material.dart';
import 'package:my_service/helper/data_source.dart';
import 'package:my_service/views/LoginScreen/login_screen.dart';
import 'package:my_service/views/MainPage/main_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.00),
          child: Column(
            children: [
              Row(
                children: [
                  const Spacer(),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFE6EAFF),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const MainPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: Color(0xFF283891),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onBoardList.length,
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    var page = onBoardList[index];
                    return Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            page.image!,
                          ),
                          radius: 120,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            page.title!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    );
                  },
                ),
              ),
              //=====================================
              buildDot(media.height * .1),

              //=====================================
              InkWell(
                onTap: () {
                  if (currentIndex == onBoardList.length - 1) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  }
                  _pageController.nextPage(
                    duration: const Duration(
                      milliseconds: 150,
                    ),
                    curve: Curves.bounceIn,
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF283891),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildDot(double height) {
    return Container(
      margin: EdgeInsets.only(bottom: height),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          3,
          (index) {
            return Container(
              height: 10,
              width: currentIndex == index ? 25 : 10,
              margin: const EdgeInsets.only(right: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF283891)),
            );
          },
        ),
      ),
    );
  }
}

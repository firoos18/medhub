import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class Onboarding {
  final String imagePath;
  final String title;
  final String desc;

  const Onboarding({
    required this.desc,
    required this.imagePath,
    required this.title,
  });
}

List<Onboarding> onboardingItems = [
  const Onboarding(
    desc:
        'Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.',
    imagePath: 'assets/images/onboarding_1.svg',
    title: 'View and buy Medicine online',
  ),
  const Onboarding(
    desc:
        'Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.',
    imagePath: 'assets/images/onboarding_2.svg',
    title: 'Online medical & Healthcare',
  ),
  const Onboarding(
    desc:
        'Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.',
    imagePath: 'assets/images/onboarding_1.svg',
    title: 'View and buy Medicine online',
  ),
  const Onboarding(
    desc:
        'Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.',
    imagePath: 'assets/images/onboarding_2.svg',
    title: 'Online medical & Healthcare',
  ),
];

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int imagePosition = 0;
  PageController pageController = PageController();

  @override
  void initState() {
    pageController = PageController(
      initialPage: imagePosition,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 500,
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (value) => setState(() {
                    imagePosition = value;
                  }),
                  itemCount: onboardingItems.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child:
                            SvgPicture.asset(onboardingItems[index].imagePath),
                      ),
                      const SizedBox(height: 50),
                      SizedBox(
                        width: 238,
                        child: Text(
                          onboardingItems[index].title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        width: 255,
                        child: Text(
                          onboardingItems[index].desc,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: const Color(0xff090F47).withOpacity(0.45),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 100),
              SizedBox(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => context.pushNamed('welcome'),
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff090F47).withOpacity(0.45),
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 1,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: onboardingItems.length,
                        itemBuilder: (context, index) => List.generate(
                          onboardingItems.length,
                          (index) => Container(
                            width: 4,
                            height: 4,
                            margin: const EdgeInsets.only(right: 4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: index == imagePosition
                                  ? const Color(0xff00A59B)
                                  : const Color(0xff090F47).withOpacity(0.15),
                            ),
                          ),
                        )[index],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        if (imagePosition < onboardingItems.length) {
                          imagePosition += 1;
                          pageController.jumpToPage(imagePosition);
                        }
                        if (imagePosition == onboardingItems.length) {
                          imagePosition = 0;
                          pageController.jumpToPage(0);
                        }
                      }),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff00A59B),
                        ),
                      ),
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/functions/navigation.dart';
import 'package:se7ety/core/services/local_storage/local_storage.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/core/widgets/custom_button.dart';
import 'package:se7ety/feature/intro/onboarding/onboarding_model.dart';
import 'package:se7ety/feature/intro/welcome_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  var pageController = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        actions: [
          if (currentPage != pages.length - 1)
            TextButton(
              onPressed: () {
                AppLocalStorage.cacheData(
                    key: AppLocalStorage.onboarding, value: true);

                pushReplacement(context, const WelcomeView());
              },
              child: Text(
                'تخطي',
                style: getBodyStyle(color: AppColors.color1),
              ),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          // pageview
          Expanded(
              child: PageView.builder(
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            itemBuilder: (context, index) {
              return Column(children: [
                // image
                const Spacer(),
                SvgPicture.asset(
                  pages[index].image,
                  width: 300,
                ),
                const Spacer(),
                // title
                Text(
                  pages[index].title,
                  style: getTitleStyle(color: AppColors.color1),
                ),
                const Gap(20),
                Text(
                  pages[index].body,
                  textAlign: TextAlign.center,
                  style: getBodyStyle(),
                ),
                const Spacer(
                  flex: 3,
                ),
              ]);
            },
            itemCount: pages.length,
          )),
          // footer
          SizedBox(
            height: 70,
            child: Row(
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: pages.length,
                  effect: SlideEffect(
                      spacing: 8.0,
                      radius: 15,
                      dotWidth: 24.0,
                      dotHeight: 13,
                      strokeWidth: 1.5,
                      dotColor: Colors.grey,
                      activeDotColor: AppColors.color1),
                ),
                const Spacer(),
                if (currentPage == pages.length - 1)
                  CustomButton(
                      height: 45,
                      text: 'هيا بنا',
                      onPressed: () {
                        AppLocalStorage.cacheData(
                            key: AppLocalStorage.onboarding, value: true);
                        pushReplacement(context, const WelcomeView());
                      },
                      width: 100)
              ],
            ),
          )
        ]),
      ),
    );
  }
}

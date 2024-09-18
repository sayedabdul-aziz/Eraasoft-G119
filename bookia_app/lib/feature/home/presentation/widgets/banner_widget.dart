import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:bookia_app/feature/home/presentation/bloc/home_event.dart';
import 'package:bookia_app/feature/home/presentation/bloc/home_state.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerHomeWidget extends StatefulWidget {
  const BannerHomeWidget({
    super.key,
  });

  @override
  State<BannerHomeWidget> createState() => _BannerHomeWidgetState();
}

class _BannerHomeWidgetState extends State<BannerHomeWidget> {
  int currentBanner = 0;

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetSlidersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          current is GetSlidersLoadingState ||
          current is GetSlidersSuccessState,
      builder: (context, state) {
        if (state is GetSlidersSuccessState) {
          var sliders =
              context.read<HomeBloc>().getSlidersResponseModel.data?.sliders;
          return Column(
            children: [
              CarouselSlider.builder(
                  itemCount: sliders?.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Stack(
                            children: [
                              Image.network(
                                sliders?[itemIndex].image ?? '',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 150,
                              ),
                              // Positioned(
                              //   top: 14,
                              //   left: 8,
                              //   child: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     mainAxisSize: MainAxisSize.min,
                              //     children: [
                              // const Text(
                              //   'Find out the best books to read \nwhen you don’t even know what \nto read!!!',
                              //   style: TextStyle(
                              //       color: Colors.white, fontSize: 14),
                              // ),
                              //       const Gap(4),
                              //       Container(
                              //         padding: const EdgeInsets.symmetric(
                              //             horizontal: 14, vertical: 7),
                              //         decoration: BoxDecoration(
                              //           borderRadius: BorderRadius.circular(5),
                              //           color: AppColors.whiteColor,
                              //         ),
                              //         child: Text('Explore',
                              //             style: getSmallTextStyle(context,
                              //                 fontSize: 10,
                              //                 color: AppColors.primaryColor)),
                              //       )
                              //     ],
                              //   ),
                              // ),
                            ],
                          )),
                  options: CarouselOptions(
                    height: 150,
                    // aspectRatio: 16 / 9,
                    viewportFraction: .8,
                    initialPage: 0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    onPageChanged: (itemIndex, reason) {
                      setState(() {
                        currentBanner = itemIndex;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                  )),
              const Gap(15),
              SmoothPageIndicator(
                  controller: PageController(
                      initialPage: currentBanner), // PageController
                  count: 4,
                  effect: const ExpandingDotsEffect(
                      activeDotColor: AppColors.primaryColor,
                      dotColor: AppColors.borderColor,
                      dotHeight: 7,
                      expansionFactor: 7,
                      dotWidth: 7), // your preferred effect

                  onDotClicked: (index) {}),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

import 'package:bookia_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SocialLoginWidget extends StatelessWidget {
  const SocialLoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SocialCard(image: 'assets/images/google.svg', onTap: () {}),
        const Gap(8),
        SocialCard(
          image: 'assets/images/facebook.svg',
          onTap: () {},
        ),
        const Gap(8),
        SocialCard(
          image: 'assets/images/apple.svg',
          onTap: () {},
        ),
      ],
    );
  }
}

class SocialCard extends StatelessWidget {
  const SocialCard({
    super.key,
    required this.image,
    required this.onTap,
  });
  final String image;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            border: Border.all(color: AppColors.borderColor, width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: SvgPicture.asset(image),
        ),
      ),
    );
  }
}

import 'package:bookia_app/core/constants/assets_icons.dart';
import 'package:bookia_app/feature/home/presentation/widgets/banner_widget.dart';
import 'package:bookia_app/feature/home/presentation/widgets/best_seller_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}
// Person()..id = 1;

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: [
            SvgPicture.asset(
              AssetsIcons.logo,
              width: 100,
            ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/notification.svg')),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/search.svg')),
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          BannerHomeWidget(),
          BestSellerBooksWidget(),
        ]),
      ),
    );
  }
}

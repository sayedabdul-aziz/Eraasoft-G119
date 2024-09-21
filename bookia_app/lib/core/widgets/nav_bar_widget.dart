import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/feature/cart/presentation/page/cart_view.dart';
import 'package:bookia_app/feature/home/presentation/page/home/home_view.dart';
import 'package:bookia_app/feature/home/presentation/page/wishlist/wishlist_view.dart';
import 'package:bookia_app/feature/profile/presentation/page/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  List<Widget> pages = [
    const HomeView(),
    const WishlistView(),
    const CartView(),
    const ProfileView()
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/Home.svg'),
              activeIcon: SvgPicture.asset(
                'assets/icons/Home.svg',
                colorFilter: const ColorFilter.mode(
                    AppColors.primaryColor, BlendMode.srcIn),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/Bookmark.svg'),
              activeIcon: SvgPicture.asset(
                'assets/icons/Bookmark.svg',
                colorFilter: const ColorFilter.mode(
                    AppColors.primaryColor, BlendMode.srcIn),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/Category.svg'),
              activeIcon: SvgPicture.asset(
                'assets/icons/Category.svg',
                colorFilter: const ColorFilter.mode(
                    AppColors.primaryColor, BlendMode.srcIn),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/Profile.svg'),
              activeIcon: SvgPicture.asset(
                'assets/icons/Profile.svg',
                colorFilter: const ColorFilter.mode(
                    AppColors.primaryColor, BlendMode.srcIn),
              ),
              label: '',
            ),
          ]),
    );
  }
}

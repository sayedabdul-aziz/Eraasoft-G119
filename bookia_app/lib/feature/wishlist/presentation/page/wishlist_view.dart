import 'package:bookia_app/core/constants/assets_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({super.key});

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(AssetsIcons.logo),
      ),
      body: const Center(child: Text('Wishlist')),
    );
  }
}

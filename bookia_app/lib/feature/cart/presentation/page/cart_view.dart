import 'package:bookia_app/core/constants/assets_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  String? token;
  @override
  void initState() {
    super.initState();
    getToken();
  }

  getToken() async {
    var pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString("token");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(AssetsIcons.logo),
      ),
      body: Center(child: Text(token ?? ' Cart ')),
    );
  }
}

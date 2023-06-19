import 'package:blog/config/custom_color.dart';
import 'package:blog/models/user.dart' as model;
import 'package:blog/provider/user_provider.dart';
import 'package:blog/widget/weather_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String id = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    model.User userLogin = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: backgroundColor,
        leading: Icon(
          FontAwesomeIcons.bars,
          size: 25.sp,
        ),
        title: Text(
          "${userLogin.displayName} Story",
          style: GoogleFonts.nunitoSans(
              color: mainTextColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 25.sp,
            ),
          ),
        ],
      ),
      body: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[SliverToBoxAdapter(child: WeatherWidget())];
          },
          body: Container()),
    );
  }
}

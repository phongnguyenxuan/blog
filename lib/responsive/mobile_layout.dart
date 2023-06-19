import 'package:blog/config/custom_color.dart';
import 'package:blog/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  int currentIndex = 0;
  final home = GlobalKey<NavigatorState>();
  final radio = GlobalKey<NavigatorState>();
  final message = GlobalKey<NavigatorState>();
  final notification = GlobalKey<NavigatorState>();
  final profile = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    debugPrint(MediaQuery.of(context).size.toString());
    return Scaffold(
      bottomNavigationBar: _bottomBar(),
      body: IndexedStack(
        index: currentIndex,
        children: [
          Navigator(
            key: home,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => const HomeScreen(),
            ),
          ),
          Navigator(
            key: radio,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => Container(),
            ),
          ),
          Navigator(
            key: message,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => Container(),
            ),
          ),
          Navigator(
            key: notification,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => Container(),
            ),
          ),
          Navigator(
            key: profile,
            onGenerateRoute: (route) => MaterialPageRoute(
                settings: route, builder: (context) => Container()),
          ),
        ],
      ),
    );
  }

  Widget _bottomBar() {
    return Container(
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.white))),
      child: SalomonBottomBar(
          backgroundColor: backgroundColor,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: Colors.grey,
          //  unselectedItemColor: Colors.white,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
              if (home.currentState!.canPop()) {
                home.currentState!
                    .pushNamedAndRemoveUntil(HomeScreen.id, (route) => false);
              }
              if (radio.currentState!.canPop()) {
                // search.currentState!.pushAndRemoveUntil(
                //     PageTransition(
                //         type: PageTransitionType.fade,
                //         child: const Search(),
                //         duration: const Duration(microseconds: 0)),
                //     (route) => false);
              }
              if (message.currentState!.canPop()) {
                // message.currentState!.pushAndRemoveUntil(
                //     PageTransition(
                //         type: PageTransitionType.fade,
                //         child: Container(),
                //         duration: const Duration(microseconds: 0)),
                //     (route) => false);
              }
              if (notification.currentState!.canPop()) {
                // notification.currentState!.pushAndRemoveUntil(
                //     PageTransition(
                //         type: PageTransitionType.fade,
                //         child: Container(),
                //         duration: const Duration(microseconds: 0)),
                //     (route) => false);
              }
              if (profile.currentState!.canPop()) {
                // profile.currentState!.pushAndRemoveUntil(
                //     PageTransition(
                //         type: PageTransitionType.fade,
                //         child: Profile(
                //           uid: FirebaseAuth.instance.currentUser!.uid,
                //         ),
                //         duration: const Duration(microseconds: 0)),
                //     (route) => false);
              }
            });
          },
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: Icon(
                Icons.home,
                size: 25.sp,
              ),
              title: const Text("Home"),
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: Icon(
                Icons.favorite_rounded,
                size: 25.sp,
              ),
              title: const Text("Radio"),
            ),

            /// Search
            SalomonBottomBarItem(
              icon: Icon(
                Icons.message,
                size: 25.sp,
              ),
              title: const Text("Message"),
            ),

            /// notifications
            SalomonBottomBarItem(
              icon: Icon(
                Icons.notifications,
                size: 25.sp,
              ),
              title: const Text("Activity"),
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: Icon(
                Icons.person,
                size: 25.sp,
              ),
              title: const Text("Profile"),
            ),
          ]),
    );
  }
}

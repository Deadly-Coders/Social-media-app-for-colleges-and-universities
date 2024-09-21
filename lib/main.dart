import 'package:flutter/material.dart';
import 'package:social_flutter/home.dart';
import 'package:social_flutter/notification1.dart';
import 'package:social_flutter/pages/auth_pages/login_page.dart';
import 'package:social_flutter/pages/career_pages/career3.dart';
import 'package:social_flutter/pages/career_pages/career4.dart';
import 'package:social_flutter/pages/chatting_pages/chatting_friends.dart';
import 'package:social_flutter/pages/chatting_pages/chatting_page.dart';
import 'package:social_flutter/pages/community_pages/communities1.dart';
import 'package:social_flutter/pages/community_pages/communities2.dart';
import 'package:social_flutter/pages/community_pages/communities3.dart';
import 'package:social_flutter/pages/friends_pages/freind1.dart';
import 'package:social_flutter/pages/friends_pages/friend2.dart';
import 'package:social_flutter/pages/game_pages/game1.dart';
import 'package:social_flutter/pages/game_pages/game2.dart';
import 'package:social_flutter/pages/market_pages/market1.dart';
import 'package:social_flutter/pages/market_pages/market2.dart';
import 'package:social_flutter/pages/market_pages/market3.dart';
import 'package:social_flutter/pages/market_pages/market4.dart';
import 'package:social_flutter/pages/market_pages/market5.dart';
import 'package:social_flutter/pages/market_pages/market6.dart';
import 'package:social_flutter/pages/market_pages/market7.dart';
import 'package:social_flutter/pages/market_pages/market8.dart';
import 'package:social_flutter/pages/market_pages/market_dash.dart';
import 'package:social_flutter/pages/resource_pages/resources1.dart';
import 'package:social_flutter/pages/resource_pages/resources2.dart';
import 'package:social_flutter/pages/settings/edit_password.dart';
import 'package:social_flutter/pages/settings/edit_profile.dart';
import 'package:social_flutter/pages/settings/setting_page.dart';
import 'package:social_flutter/profile.dart';
import 'package:social_flutter/video_player.dart';
import 'package:video_player/video_player.dart';
import 'pages/career_pages/career1.dart';
import 'pages/career_pages/career2.dart';
import 'pages/community_pages/communities4.dart';
import 'pages/friends_pages/friend3.dart';
import 'pages/resource_pages/resources3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Socail Media App',
      theme: ThemeData(
        colorSchemeSeed: Colors.white,
        useMaterial3: true,
      ),
      initialRoute: "Login",
      routes: {
        "Home": (context) => const UniConnectApp(),
        "Market": (context) => const MarketDash(),
        "Market1": (context) => const Market1(),
        "Market2": (context) => const Market2(
              title: "Market2",
            ),
        "Market3": (context) => const Market3(
              title: "Market3",
            ),
        "Market4": (context) => const Market4(),
        "Market5": (context) => const Market5(
              title: "Market5",
            ),
        "Market6": (context) => const Market6(
              title: "Market6",
            ),
        "Market7": (context) => const Market7(),
        "Market8": (context) => const Market8(),
        "Career1": (context) => const Career1(),
        "Career2": (context) => const Career2(),
        "Career3": (context) => const Career3(),
        "Career4": (context) => const Career4(),
        "Communities1": (context) => const Communities1(),
        "Communities2": (context) => const Communities2(),
        "Communities3": (context) => const Communities3(),
        "Communities4": (context) => const CampusTourScreen(),
        "Freind1": (context) => const Freind1(),
        "Friend2": (context) => const Friend2(),
        "Friend3": (context) => const Friend3(),
        "Game1": (context) => const Game1(
              title: '',
            ),
        "Game2": (context) => const Game2(),
        "Resources1": (context) => const Resources1(),
        "Resources2": (context) => const Resources2(
              title: '',
            ),
        "Resources3": (context) => const Resources3(),
        "Notification1": (context) => const Notification1(title: ''),
        "Profile": (context) => const ProfilePage(
              userId: '',
            ),
        "Login": (context) => const LoginPage(
              title: '',
            ),
        "Settings": (context) => const SettingPage(),
        "Settings2": (context) => const EditProfile(),
        "Settings3": (context) => const EditPassword(),
        "FriendsChatScreen": (context) => const ChattingFriends(),
        "ChattingPage": (context) => const ChattingPage(
              friendId: '',
              userId: '',
              friendName: '',
            ),
        "Video": (context) => const VideoScreen(
              videoPath: '',
            ),
      },
    );
  }
}

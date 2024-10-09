import 'imports_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

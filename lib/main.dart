import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:townteam_app/common/models/auth_provider.dart';
import 'package:townteam_app/common/models/cart_provider.dart';
import 'package:townteam_app/common/models/nav_provider.dart';
import 'package:townteam_app/common/services/git_it_service.dart';
import 'package:townteam_app/features/Cart/presentation/view/cart_page.dart';
import 'package:townteam_app/features/KidsCatogry/presentation/view/kids_catogry.dart';
import 'package:townteam_app/features/MensCatogry/presentation/view/mens_catogry.dart';
import 'package:townteam_app/features/auth/presentation/view/signUp_view.dart';
import 'package:townteam_app/features/homepage/presentation/view/home_page.dart';
import 'package:townteam_app/features/product/presentaion/view/product_page.dart';
import 'package:townteam_app/features/splashScreen/presentation/view/landing_page.dart';
import 'package:townteam_app/features/auth/presentation/view/login_page.dart';
import 'package:townteam_app/features/payment/presentation/view/payment_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupGitIt();
  runApp(const TownTeamApp());
}

class TownTeamApp extends StatelessWidget {
  const TownTeamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
          title: 'TownTeam App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          debugShowCheckedModeBanner: false,
          routes: {
            '/landing': (context) => const LandingPage(),
            '/home': (context) => HomePage(),
            '/cart': (context) => const CartPage(),
            LoginPage.id: (context) => const LoginPage(),
            SignupView.id: (context) => const SignupView(),
            MensCatogry.id: (context) => const MensCatogry(),
            KidsCatogry.id: (context) => const KidsCatogry(),
          },
          initialRoute: '/landing',
          onGenerateRoute: (settings) {
            if (settings.name == '/product') {
              final args = settings.arguments as Map<String, dynamic>;
              return MaterialPageRoute(
                builder: (context) => ProductPage(
                  path: args['path']!,
                  subcategory: args['subcategory']!,
                  title: args['title']!,
                ),
              );
            }
            return null;
          }),
    );
  }
}

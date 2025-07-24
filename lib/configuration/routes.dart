import 'package:reco_genie_task/features/splash_feature/presentation_layer/screens/splash_screen.dart';
import 'package:reco_genie_task/features/welcome_feature/presentation_layer/screens/welcome_screen.dart';
import 'package:go_router/go_router.dart';

import '../features/authentication_feature/presentaion_layer/screens/sign_in_screen.dart';
import '../features/authentication_feature/presentaion_layer/screens/sign_up_screen.dart';
import '../features/main_shell_feature/presentation_layer/screens/main_shell_screen.dart';

class AppRoute {
  static const splashScreen = '/splash-screen';
  static const welcomeScreen = '/welcome-screen';
  static const signInScreen = '/sing-in-screen';
  static const signUpScreen = '/sing-up-screen';
  static const mainShellScreen = '/main-screen';

  static final router = GoRouter(initialLocation: splashScreen, routes: [
    GoRoute(
      path: splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: welcomeScreen,
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: signInScreen,
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: signUpScreen,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: mainShellScreen,
      builder: (context, state) => const MainShellScreen(),
    ),
  ]);
}

import 'package:flutter/material.dart';
import '../../../features/home/presentation/pages/home_screen.dart';
import '../../../features/subjects/presentation/pages/subjects_screen.dart';
import '../../../features/homeworks/presentation/pages/homeworks_screen.dart';
import '../../../features/behavior/presentation/pages/behavior_screen.dart';
import '../../../features/grades/presentation/pages/grades_screen.dart';

class Routes {
  static const String home = '/';
  static const String subjects = '/subjects';
  static const String homeworks = '/homeworks';
  static const String behavior = '/behavior';
  static const String grades = '/grades';
}

class OnGeneratedRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );

      case Routes.subjects:
        return MaterialPageRoute(
          builder: (_) => const SubjectsScreen(),
          settings: settings,
        );

      case Routes.homeworks:
        return MaterialPageRoute(
          builder: (_) => const HomeworksScreen(),
          settings: settings,
        );

      case Routes.behavior:
        return MaterialPageRoute(
          builder: (_) => const BehaviorScreen(),
          settings: settings,
        );

      case Routes.grades:
        return MaterialPageRoute(
          builder: (_) => const GradesScreen(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}

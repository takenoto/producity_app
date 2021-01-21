import 'package:flutter/material.dart';
import 'package:producity_app/business_logic/pomodoro_session_notifier.dart';
import 'package:producity_app/constants/colors.dart';
import 'package:producity_app/data/models/pomodoro_session.dart';
import 'package:producity_app/presentation/screens/home_screen.dart';
import 'package:producity_app/route_generator.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PomodoroSessionNotifier(PomodoroSession.mockDefault()),
      child: MaterialApp(
        // debugShowMaterialGrid: true,
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        title: 'Producity',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: kLightColorShade,
        ),
        home: HomeScreen(),
        initialRoute: HomeScreen.RouteName,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}

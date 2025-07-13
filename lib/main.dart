import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_app/view_model/commpnas/color.dart';
import 'package:food_app/viwes/screens/Home_Page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/model/cubit/ItemProvider.dart';
import 'package:food_app/model/cubit/cubit/bloc.dart';
import 'package:food_app/viwes/screens/Account_Screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'viwes/screens/Home LoginScreen.dart';
import 'view_model/commpnas/helper/ThemeProvider.dart';

void main() async {
  // debugPaintSizeEnabled = true; // ← بتفعل وضع تحديد العناصر

  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // FirebaseAuth.instance.setSettings(appVerificationDisabledForTesting: true);
  await Supabase.initialize(
    url: 'https://wdbxjlxggqnauhzbjofr.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndkYnhqbHhnZ3FuYXVoemJqb2ZyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTE4MDM0OTIsImV4cCI6MjA2NzM3OTQ5Mn0.tRIpIrnpcvDYgOnCgxHKd8tKLb60MfPnM6fK382xRbM',
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ItemProvider()),
        ChangeNotifierProvider(create: (context) => ItemCard()),

        ChangeNotifierProvider(
            create: (context) => ThemeProvider()), // Add ThemeProvider
      ],
      child: BlocProvider<AppCubit>(
        create: (context) => AppCubit()..getCategories(),
        child: MyApp(), // Main app widget
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      decoration: const BoxDecoration(
        gradient: appBackgroundGradient,
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        routes: {
          '/account': (context) => AccountScreen(),
        },
      ),
    );
  }
}

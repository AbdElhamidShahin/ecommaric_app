import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_app/view_model/commpnas/color.dart';
import 'package:food_app/viwes/screens/Home_Page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/model/cubit/ItemProvider.dart';
import 'package:food_app/model/cubit/cubit/bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'view_model/commpnas/helper/ThemeProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://wdbxjlxggqnauhzbjofr.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndkYnhqbHhnZ3FuYXVoemJqb2ZyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTE4MDM0OTIsImV4cCI6MjA2NzM3OTQ5Mn0.tRIpIrnpcvDYgOnCgxHKd8tKLb60MfPnM6fK382xRbM',
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ItemProvider()),
        ChangeNotifierProvider(
          create: (context) => ItemCard()..loadCard(),
        ),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: BlocProvider(
        create: (context) => AppCubit()..getCategories(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.transparent,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.transparent,
      ),
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: const BoxDecoration(
          gradient: appBackgroundGradient,
        ),
        child: const HomePage(),
      ),
    );
  }
}

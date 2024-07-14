import 'package:code_charm/screens/services_screen.dart';
import 'package:flutter/material.dart';
import 'screens/HomeScreen/home_screen.dart';

void main() {
    // Ensure to initialize WidgetsBinding
  // WidgetsFlutterBinding.ensureInitialized();
  // // Initialize WebView for Android
  // if (WebView.platform == null) {
  //   WebView.platform = SurfaceAndroidWebView();
  // }


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Code Charm',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Theme.of(context).textTheme.apply(
                  fontFamily: 'Open Sans',
                )),

      home: const HomeScreen(),
    );
  }
}

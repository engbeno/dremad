// main.dart
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dr. Emad Bayoumi',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF0A1929),
          onPrimary: Colors.white,
          secondary: Color(0xFF2B5B8C),
          onSecondary: Colors.white,
          error: Colors.redAccent,
          onError: Colors.white,
          // ignore: deprecated_member_use
          background: Color(0xFFF5F7FA),
          // ignore: deprecated_member_use
          onBackground: Color(0xFF1A2C3E),
          surface: Colors.white,
          onSurface: Color(0xFF1A2C3E),
          tertiary: Color(0xFF4CAF50),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A1929),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xFFF5F7FA))
      ..loadRequest(Uri.parse("https://www.emadbayoumi.com/"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dr. Emad Bayoumi"),
        leading: const Icon(Icons.school_outlined),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              controller.reload();
            },
          ),
        ],
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}

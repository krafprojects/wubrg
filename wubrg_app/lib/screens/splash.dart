import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:wubrg_app/screens/account.dart';
import 'package:wubrg_app/screens/login_screen.dart';
// import 'package:wubrg_app/screens/start_screen.dart';
// import 'package:wubrg_app/services/database_service.dart';
// import 'package:supabase_quickstart/main.dart';
final supabase = Supabase.instance.client;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkSession();
  }

  Future<void> _checkSession() async {
    await Future.delayed(Duration.zero);
    final session = supabase.auth.currentSession;

    if (!mounted) return;

    if (session != null) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const LoginPage()));
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const AccountScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Splash Screen'),
          centerTitle: true,
        ),
        drawer: TextButton(
          onPressed: () {},
          child: const Icon(Icons.menu),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ));
  }
}

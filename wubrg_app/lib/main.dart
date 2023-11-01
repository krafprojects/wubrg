import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:wubrg_app/screen/login_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

Future<void> main() async {
  // await dotenv.load(fileName: '/.env.local');
  // await Supabase.initialize(
  //   url: dotenv.env['NEXT_PUBLIC_SUPABASE_URL']!,
  //   anonKey: dotenv.env['NEXT_PUBLIC_SUPABASE_ANON_KEY']!,
  // );
  await Supabase.initialize(
    url:'https://yilwoivnjbypetkfsyyo.supabase.co',
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlpbHdvaXZuamJ5cGV0a2ZzeXlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTY0NTI0NTUsImV4cCI6MjAxMjAyODQ1NX0.3zWKrWYXRDAQ6s1QB3c7wcymA642SQSJluxGXFC4C_8",
  );
  runApp(const MyApp());
}   

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Wubr Drafter'),
      home: const LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

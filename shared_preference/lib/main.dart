import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String _theme = 'Light';
  late ThemeData _themeData; // Usando 'late' para indicar que será inicializado no initState

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _themeData,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('SharedPreferences'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _setTheme('Light');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, 
                  onPrimary: Colors.white, 
                ),
                child: Text("Light"),
              ),
              SizedBox(height: 16), 
              ElevatedButton(
                onPressed: () {
                  _setTheme('Dark');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.indigo, 
                  onPrimary: Colors.white, 
                ),
                child: Text("Dark"),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _theme = prefs.getString('theme') ?? 'Light';
      _themeData = _theme == 'Dark' ? ThemeData.dark() : ThemeData.light();
    });
  }

  _setTheme(theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _theme = theme;
      _themeData = theme == 'Dark' ? ThemeData.dark() : ThemeData.light();
      prefs.setString('theme', theme);
    });
  }
}

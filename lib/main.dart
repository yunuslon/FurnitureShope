import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furniture_shop/app_starter.dart';
import 'package:furniture_shop/config/theme.dart';
import 'package:furniture_shop/providers/app_state_provider.dart';
import 'package:furniture_shop/providers/auth_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => AppStateProvider()),
        ChangeNotifierProvider(create: (ctx) => AuthProvider()),
      ],
      child: MaterialApp(
        title: 'Furniture Shop App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const AppStarter(),
      ),
    );
  }
}

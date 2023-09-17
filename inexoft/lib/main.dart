import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:inexoft/controller/password_visibility_provider.dart';
import 'package:inexoft/controller/purchase_details.dart';
import 'package:inexoft/controller/quantity_provider.dart';
import 'package:inexoft/model/hive.db.dart';
import 'package:inexoft/view/screens/bottomnav.dart';
import 'package:inexoft/view/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PurchaseModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => QuantityProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => PasswordVisibilityProvider(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Inexoft Technologies',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const LoginPage(),
        ));
  }
}

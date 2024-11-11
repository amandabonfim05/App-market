
import 'package:app_mercado/providers/ProductListProvider.dart';
import 'package:app_mercado/screens/AddProductScreen.dart';
import 'package:app_mercado/screens/HomeScreen.dart';
import 'package:app_mercado/screens/LoginScreen.dart';
import 'package:app_mercado/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/routes.dart';

void main() {
  runApp(const Login());
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ProductListProvider())],
      child: MaterialApp(
        home: Scaffold(
          appBar: myAppBar(context, "Faça o login"),
          body: LoginScreen(),
          
        ),
        routes: {
          Routes.LOGIN_SCREEN: (context) => LoginScreen(),
          Routes.HOME: (context) => HomeScreen(),
          Routes.ADD_PRODUCT: (context) => AddProductScreen(),
        },
      ),
    );
    
    
    
    
    
  }
}



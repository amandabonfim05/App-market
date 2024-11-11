import 'package:app_mercado/config/routes.dart';
import 'package:app_mercado/providers/ProductListProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/primaryButton.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Stack(
          children: [
            Card(
              elevation: 10,
              color: Color.fromARGB(159, 211, 211, 211),
              child: SizedBox(
                //height: double.infinity - 700,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height ,
                ),
              ),
            ),
            Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(50.0),
                  child: FlutterLogo(size: 150),),
              ),
              Center(
                child: 
                  Text("Bem vindo ao Mercado!", style: TextStyle(fontSize: 32.0),),   
              ),
              Container(
                padding: EdgeInsets.only(left:50.0, top:40.0),
                child: Text("Entre com o e-mail"),
              ),
              Container(
                padding: EdgeInsets.only(left:50.0, right:50.0),
                child: TextField(),
              ),
               Container(
                padding: EdgeInsets.only(left:50.0, top:40.0),
                child: Text("Entre com a senha"),
              ),
              Container(
                padding: EdgeInsets.only(left:50.0, right:50.0, bottom: 50.0),
                child: TextField(obscureText: true,),
              ),
              
              primaryButton("Entrar", () => {
                                              Navigator.of(context).pushNamed(Routes.HOME),
                                              Provider.of<ProductListProvider>(context, listen: false).initDB()
                                            })
              
              

              
            ],
          )
        ],
        )
        
        );
  }
}
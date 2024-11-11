

import 'package:flutter/material.dart';

import '../config/routes.dart';

AppBar myAppBar(BuildContext context,String texto,){

  return AppBar(
          title: Text(texto, 
                            style: TextStyle(color: 
                                          Color.fromARGB(255, 255, 254, 254)),),
          backgroundColor: const Color.fromARGB(206, 244, 11, 11),
          leading: IconButton(
            icon: const Icon(Icons.home),
            color: const Color.fromARGB(255, 255, 254, 254),
            onPressed: () => { Navigator.of(context).pushNamed(Routes.HOME)},
          ),
        );
}
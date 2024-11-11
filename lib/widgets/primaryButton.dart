
import 'package:flutter/material.dart';

Widget primaryButton(String text, Function() f){

  return Center(
                child: ElevatedButton(child: Text(text), 
                                      onPressed: f,
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(300, 60),
                                        backgroundColor: 
                                        const Color.fromARGB(206, 244, 11, 11),
                                        shape: StadiumBorder(),
                                      )),
              );
}
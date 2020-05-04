import 'package:flutter/material.dart';
Widget headerNameLogo(double width, bool darkMode){
  return new Padding(
              padding: EdgeInsets.only(top: 40, left: 0),
              child: Row(
                children: <Widget>[
                  Container(
                    color: darkMode ? Colors.grey[850] : Colors.transparent,
                    height: 80,
                    width: width * 0.70,
                    child: Row(
                      children: <Widget>[
                        new Container(
                          height: 70,
                          width: 75,
                          color: Colors.transparent,
                          child: Image(image: AssetImage("asset/logo.png")),
                        ),
                        new Container(
                          child: Text(
                            "Firenote",
                            style: TextStyle(
                                fontSize: 40,
                                fontFamily: 'Pacifico',
                                color: darkMode ? Colors.white : Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 50,
                          height: 50,
                          transform: Matrix4.translationValues(35, 5.0, 0.0),
                          child: Container(
                            child: Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(245, 52, 86, 0.9),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              boxShadow: [
                                BoxShadow(
                                    color: darkMode
                                        ? Colors.black54
                                        : Colors.grey[500],
                                    offset: Offset(4.0, 4.0),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0),
                                BoxShadow(
                                    color: darkMode
                                        ? Colors.grey[800]
                                        : Colors.white,
                                    offset: Offset(-4.0, -4.0),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0),
                              ]),
                        ),
                      ])
                ],
              ));
}
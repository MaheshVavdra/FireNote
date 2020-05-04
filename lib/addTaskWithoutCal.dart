import 'package:flutter/material.dart';
import 'header.dart';

class AddTaskWithoutCal extends StatefulWidget {
  @override
  _AddTaskWithoutCal createState() => _AddTaskWithoutCal();
}

class _AddTaskWithoutCal extends State<AddTaskWithoutCal> {
  bool darkMode = false;
  int priorityLevel = 1;
  double shadowOffset = 14;  

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    Widget titleText(String title) {
      return Container(
        margin: EdgeInsets.only(left: width * 0.10),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Pacifico',
            color: darkMode ? Color.fromRGBO(243, 249, 253, 1) : Colors.black,
          ),
          textAlign: TextAlign.left,
        ),
      );
    }

    Widget shadowTextField(String hintText, double lMar, double rMar,
        double widthPercent, bool isText, isTitle) {          
      return Container(
        // Width should be either 80% with margin of 10% or 40% with margin of 5%
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        margin: EdgeInsets.only(left: width * lMar, right: width * rMar),
        width: width * widthPercent,
        height: 60,
        decoration: BoxDecoration(
            color:
                darkMode ? Colors.grey[850] : Color.fromRGBO(229, 241, 250, 1),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  color: darkMode
                      ? Colors.black54
                      : Color.fromRGBO(202, 224, 238, 1),
                  offset: Offset(14.0, 14.0),
                  blurRadius: 25.0,
                  spreadRadius: 1.0),
              BoxShadow(
                  color: darkMode
                      ? Colors.grey[800]
                      : Color.fromRGBO(243, 249, 253, 1),
                  offset: Offset(-14.0, -14.0),
                  blurRadius: 25.0,
                  spreadRadius: 1.0),
            ]),
        child: Container(
          margin: EdgeInsets.only(left: 10),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(color: darkMode? Colors.white: Colors.black),
            ),
            keyboardType: isText
                ? isTitle ? TextInputType.text : TextInputType.multiline
                : TextInputType.number,
          ),
        ),
      );
    }

    setPriosity(int pr) {
      priorityLevel = pr;
    }
    darkMode ? shadowOffset = 5: shadowOffset = 14;
    return Scaffold(
      backgroundColor: darkMode
          ? Colors.grey[850]
          : Color.fromRGBO(229, 241, 250,
              1), //darkMode ? Colors.grey[850] : Color.fromRGBO(229, 241, 250, 1)
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          headerNameLogo(width, darkMode),
          SizedBox(
            height: 30,
          ),
          titleText("Task Title.."),
          SizedBox(
            height: 15,
          ),
          shadowTextField("My Task Title", 0.10, 0.10, 0.80, true, true),
          SizedBox(
            height: 30,
          ),
          titleText("Task Discription.."),
          SizedBox(height: 15),
          shadowTextField("My Task Discription", 0.10, 0.10, 0.80, true, false),
          SizedBox(height: 30),
          Container(
            width: width,
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    titleText("Days Left"),
                    SizedBox(height: 15),
                    shadowTextField("Days Left", 0.10, 0.05, 0.35, false, false)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      transform: Matrix4.translationValues(-18, 0, 0),
                      child: titleText("Buffer time.."),
                    ),
                    SizedBox(height: 15),
                    shadowTextField(
                        "Remind me in ", 0.05, 0.10, 0.35, false, false),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          titleText("Task Priorities.."),
          SizedBox(height: 15),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  //  transform: Matrix4.translationValues(35, 5.0, 0.0),
                  margin:
                      EdgeInsets.only(left: width * 0.10, right: width * 0.05),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        setPriosity(1);
                      });
                    },
                    child: Container(
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Text(
                            "Low",
                            style: TextStyle(
                                fontFamily: 'Pacifico',
                                fontSize: 20,
                                color: ((priorityLevel == 1) || (darkMode))
                                    ? Color.fromRGBO(243, 249, 253, 1)
                                    : Colors.black),
                          ),
                        )),
                  ),
                  decoration: BoxDecoration(
                      color: (priorityLevel == 1)
                          ? Color.fromRGBO(245, 52, 86, 0.9)
                          : darkMode ? Colors.grey[850] : Color.fromRGBO(229, 241, 250, 1),
                      // darkMode
                      //     ? Colors.grey[850]
                      //     : Color.fromRGBO(245, 52, 86, 0.9),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                            color: darkMode ? Colors.black54 : Color.fromRGBO(202, 224, 238, 1),
                            offset: Offset(shadowOffset, shadowOffset),
                        blurRadius: 25.0,
                        spreadRadius: 5.0),
                        BoxShadow(
                            color: darkMode ? Colors.grey[800] : Color.fromRGBO(243, 249, 253, 1),
                            offset: Offset(-shadowOffset, -shadowOffset),
                            blurRadius: 25.0,
                            spreadRadius: 5.0),
                      ]),
                ),
              ),
              Expanded(
                child: Container(
                  width: 50,
                  height: 50,
                  //  transform: Matrix4.translationValues(35, 5.0, 0.0),
                  margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Container(
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            setPriosity(2);
                          });
                        },
                        child: Text(
                          "Medium",
                          style: TextStyle(
                              fontFamily: 'Pacifico',
                              fontSize: 20,
                              color: ((priorityLevel == 2) || (darkMode))
                                  ? Color.fromRGBO(243, 249, 253, 1)
                                  : Colors.black),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: (priorityLevel == 2)
                          ? Color.fromRGBO(245, 52, 86, 0.9)
                          : darkMode ? Colors.grey[850] : Color.fromRGBO(229, 241, 250, 1),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                            color: darkMode ? Colors.black54 : Color.fromRGBO(202, 224, 238, 1),
                            offset: Offset(shadowOffset, shadowOffset),
                        blurRadius: 25.0,
                        spreadRadius: 5.0),
                        BoxShadow(
                            color: darkMode ? Colors.grey[800] : Color.fromRGBO(243, 249, 253, 1),
                            offset: Offset(-shadowOffset, -shadowOffset),
                        blurRadius: 25.0,
                        spreadRadius: 5.0),
                      ]),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      setPriosity(3);
                    });
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    //  transform: Matrix4.translationValues(35, 5.0, 0.0),
                    margin: EdgeInsets.only(
                        left: width * 0.05, right: width * 0.10),
                    child: Container(
                      child: Center(
                        child: Text(
                          "High",
                          style: TextStyle(
                              fontFamily: 'Pacifico',
                              fontSize: 20,
                              color: ((priorityLevel == 3) || (darkMode))
                                  ? Color.fromRGBO(243, 249, 253, 1)
                                  : Colors.black),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: (priorityLevel == 3)
                            ? Color.fromRGBO(245, 52, 86, 0.9)
                            : darkMode ? Colors.grey[850] : Color.fromRGBO(229, 241, 250, 1),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        boxShadow: [
                          BoxShadow(
                              color:
                                  darkMode ? Colors.black54 : Color.fromRGBO(202, 224, 238, 1),
                              offset: Offset(shadowOffset, shadowOffset),
                        blurRadius: 25.0,
                        spreadRadius: 5.0),
                          BoxShadow(
                              color: darkMode ? Colors.grey[800] : Color.fromRGBO(243, 249, 253, 1),
                              offset: Offset(-shadowOffset, -shadowOffset),
                        blurRadius: 25.0,
                        spreadRadius: 5.0),
                        ]),
                  ),
                ),
              ),
            ],
          ),
          Container(
              transform:
                  Matrix4.translationValues(width / 1.9, height * 0.10, 0.0),
              width: width * 0.70,
              height: 60,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(245, 52, 86, 0.9),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                        color: darkMode ? Colors.black54 : Color.fromRGBO(202, 224, 238, 1),
                        offset: Offset(shadowOffset, shadowOffset),
                        blurRadius: 25.0,
                        spreadRadius: 5.0),
                    BoxShadow(
                        color: darkMode ? Colors.grey[800] : Color.fromRGBO(243, 249, 253, 1),
                        offset: Offset(-shadowOffset, -shadowOffset),
                        blurRadius: 25.0,
                        spreadRadius: 5.0),
                  ]),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Save my task ",
                      style: TextStyle(
                          color: Color.fromRGBO(243, 249, 253, 1),
                          fontFamily: 'Pacifico',
                          fontSize: 20),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromRGBO(243, 249, 253, 1),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

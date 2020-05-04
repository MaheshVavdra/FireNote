import 'package:flutter/material.dart';
import 'header.dart';

class AddTaskWithCal extends StatefulWidget {
  @override
  _AddTaskWithCal createState() => _AddTaskWithCal();
}

class _AddTaskWithCal extends State<AddTaskWithCal> {
  bool darkMode = false;
  int priorityLevel = 1;

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
            color: darkMode ? Colors.white : Colors.black,
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
            color: darkMode ? Colors.grey[850] : Colors.grey[300],
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  color: darkMode ? Colors.black54 : Colors.grey[500],
                  offset: Offset(4.0, 4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
              BoxShadow(
                  color: darkMode ? Colors.grey[800] : Colors.white,
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
            ]),
        child: Container(
          margin: EdgeInsets.only(left: 10),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
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

    return Scaffold(
      backgroundColor: darkMode ? Colors.grey[850] : Colors.grey[300],
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
            height: 10,
          ),
          shadowTextField("My Task Title", 0.10, 0.10, 0.80, true, true),
          SizedBox(
            height: 30,
          ),
          titleText("Task Discription.."),
          SizedBox(height: 10),
          shadowTextField("My Task Discription", 0.10, 0.10, 0.80, true, false),
          //SizedBox(height: 30),
          // Container(
          //   width: width,
          //   child: Row(
          //     children: <Widget>[
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: <Widget>[
          //           SizedBox(height: 10),
          //           shadowTextField("Days Left", 0.10, 0.05, 0.20, false, false)
          //         ],
          //       ),
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: <Widget>[
          //           SizedBox(height: 10),
          //           shadowTextField(
          //               "Remind me in ", 0.05, 05, 0.20, false, false),
          //         ],
          //       ),
          //        Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: <Widget>[
          //           SizedBox(height: 10),
          //           shadowTextField(
          //               "Remind me in ", 0.05, 0.10, 0.20, false, false),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(height: 30),
          titleText("Event Date"),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                    margin: EdgeInsets.only(
                        left: width * 0.05, right: width * 0.02),
                    padding: EdgeInsets.only(left: 10),
                    child: shadowTextField("DD", 0, 0, 0.25, false, false)),
              ),
              Expanded(
                child: Container(
                    margin: EdgeInsets.only(
                        left: width * 0.03, right: width * 0.03),
                    padding: EdgeInsets.only(left: 10),
                    child: shadowTextField("MM", 0, 0, 0.20, false, false)),
              ),
              Expanded(
                child: Container(
                    margin: EdgeInsets.only(
                        left: width * 0.02, right: width * 0.05),
                    padding: EdgeInsets.only(left: 10),
                    child: shadowTextField("YY", 0, 0, 0.20, false, false)),
              ),
            ],
          ),
          SizedBox(height: 30),
          titleText("Task Priorities.."),
          SizedBox(height: 10),
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
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        )),
                  ),
                  decoration: BoxDecoration(
                      color: (priorityLevel == 1)
                          ? Color.fromRGBO(245, 52, 86, 0.9)
                          : darkMode ? Colors.grey[850] : Colors.grey[300],
                      // darkMode
                      //     ? Colors.grey[850]
                      //     : Color.fromRGBO(245, 52, 86, 0.9),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                            color: darkMode ? Colors.black54 : Colors.grey[500],
                            offset: Offset(4.0, 4.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0),
                        BoxShadow(
                            color: darkMode ? Colors.grey[800] : Colors.white,
                            offset: Offset(-4.0, -4.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0),
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
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: (priorityLevel == 2)
                          ? Color.fromRGBO(245, 52, 86, 0.9)
                          : darkMode ? Colors.grey[850] : Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                            color: darkMode ? Colors.black54 : Colors.grey[500],
                            offset: Offset(4.0, 4.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0),
                        BoxShadow(
                            color: darkMode ? Colors.grey[800] : Colors.white,
                            offset: Offset(-4.0, -4.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0),
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
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: (priorityLevel == 3)
                            ? Color.fromRGBO(245, 52, 86, 0.9)
                            : darkMode ? Colors.grey[850] : Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        boxShadow: [
                          BoxShadow(
                              color:
                                  darkMode ? Colors.black54 : Colors.grey[500],
                              offset: Offset(4.0, 4.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0),
                          BoxShadow(
                              color: darkMode ? Colors.grey[800] : Colors.white,
                              offset: Offset(-4.0, -4.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0),
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
                        color: darkMode ? Colors.black54 : Colors.grey[500],
                        offset: Offset(4.0, 4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0),
                    BoxShadow(
                        color: darkMode ? Colors.grey[800] : Colors.white,
                        offset: Offset(-4.0, -4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0),
                  ]),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Save my task ",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Pacifico',
                          fontSize: 20),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

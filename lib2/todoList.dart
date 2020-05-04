import 'package:flutter/material.dart';
import 'package:todo/header.dart';
import 'todo_list_icon_icons.dart' as CustomeIcons;

class TodoList extends StatefulWidget {
  @override
  _TodoList createState() => _TodoList();
}

class _TodoList extends State<TodoList> {
  //Bounce list through Transform Widget
  bool darkMode = false;
  List<String> listData = [
    "Title one",
    "Title Two",
    "Title Three", 
    "Title one",
    "Title Two",
    "Title Three",
    "Title one",
    "Title Two",
    "Title Three",
    "Title one",
    "Title Two",
    "Title Three",
    "Title one",
    "Title Two",
    "Title Three",
  ];
  // Widget listItem(BuildContext context, int index) {
  //   return Card(
  //     child: Text("data")
  //   );
  // }
  int flg = 0;  //used to set verticle padding for first item
  Widget todoList(int index, BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    flg++;
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
              height: 50,
              width: width * 0.50,
              margin: EdgeInsets.symmetric(vertical: (flg == 1)? 20: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: darkMode ? Colors.grey[850] : Colors.grey[300],
                  boxShadow: [
                    BoxShadow(
                      color: darkMode ? Colors.black54 : Colors.grey[500],
                      offset: Offset(4, 4),
                      spreadRadius: 1.0,
                      blurRadius: 15,
                    ),
                    BoxShadow(
                      color: darkMode ? Colors.grey[800] : Colors.white,
                      offset: Offset(-4, -4),
                      spreadRadius: 1,
                      blurRadius: 15,
                    ),
                  ]),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical:5),
                child: new Text(
                  listData[index],
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Pacifico',
                    color: darkMode ? Colors.white : Colors.black,
                  ),
                ),
              )),
        ),
        Container(
          width: 50,
          height: 50,
          margin: EdgeInsets.only(left: 25.0),
          transform: Matrix4.translationValues(0.0, 0.0, 0.0),
          child: Container(
            child: Tab(icon:Icon( CustomeIcons.TodoListIcon.edit,color:Colors.black)),
          ),
          decoration: BoxDecoration(
              color: darkMode ? Colors.grey[850] : Colors.grey[300],
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
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: darkMode ? Colors.grey[850] : Colors.grey[300],
        body: Column(
          children: <Widget>[
            headerNameLogo(width, darkMode),
            Container(
              height: height - 120, // height - (padding + header height)
              child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  physics: BouncingScrollPhysics(),
                  children: List.generate(listData.length, (index) {
                    return todoList(index, context);
                  })),
            ),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:todo/addTaskWithoutCal.dart';
import 'LeftRightAlign.dart';
import 'Quotes.dart';
import 'dart:math';
import 'sun_moon_add_cal_icons.dart' as CustIcons;
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

final rand = Random();
int min, max;

class IntroPage extends StatefulWidget {
  @override
  _IntroPage createState() => _IntroPage();
}

class _IntroPage extends State<IntroPage> with TickerProviderStateMixin {
  bool darkMode = false;
  Color fontcolor = Colors.black;
  var moonSun = CustIcons.SunMoonAddCal.moon;

  AnimationController _lightToDarkAnimationController;
  Animation _lightToDarkBgColorTween;
  Animation _lightToDarkFontColorTween;
  Animation _lightToDarkCardColorTween;
  Animation _lightToDarkPrimaryCardColorTween;
  Animation _lightToDarkPrimaryShadowColorTween;
  Animation _lightToDarkSecondaryShadowColorTween;

  SequenceAnimation _tutLengthAnimation;
  AnimationController _tutAnimationController;

  var helpPosition = 350;
  double posOne = 1, posTwo = 1, posThree = 1;
  double infoWidth = 70;
  List<String> infoMessage = ["Plan by Days", "Plan by Dates", "Night Mode"];
  double infoTag = 0;

  @override
  void initState() {
    super.initState();

    // initial Variable initialisation
    //helpPosition = 250;
    _lightToDarkAnimationController = AnimationController(
        vsync: this,
        duration: new Duration(
          milliseconds: 400,
        ));
    _lightToDarkBgColorTween =
        ColorTween(begin: Colors.grey[300], end: Colors.grey[800])
            .animate(_lightToDarkAnimationController);

    _lightToDarkCardColorTween =
        ColorTween(begin: Colors.grey[300], end: Colors.grey[850])
            .animate(_lightToDarkAnimationController);

    _lightToDarkPrimaryCardColorTween = ColorTween(
            begin: Color.fromRGBO(245, 52, 86, 0.9), end: Colors.grey[850])
        .animate(_lightToDarkAnimationController);

    _lightToDarkFontColorTween =
        ColorTween(begin: Colors.black, end: Colors.white)
            .animate(_lightToDarkAnimationController);

    _lightToDarkPrimaryShadowColorTween =
        ColorTween(begin: Colors.grey[500], end: Colors.black54)
            .animate(_lightToDarkAnimationController);

    _lightToDarkSecondaryShadowColorTween =
        ColorTween(begin: Colors.white, end: Colors.grey[800])
            .animate(_lightToDarkAnimationController);

    _tutAnimationController = AnimationController(vsync: this);

    _tutLengthAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 0),
            curve: Curves.easeOut,
            from: Duration(
              milliseconds: 0,
            ),
            to: Duration(milliseconds: 1),
            tag: "textOpacity")
        .addAnimatable(
            curve: Curves.elasticOut,
            animatable: Tween(begin: helpPosition, end: 0),
            from: Duration(
              milliseconds: 0,
            ),
            to: Duration(milliseconds: 1200),
            tag: "topBottom")
        .addAnimatable(
            animatable: Tween<double>(begin: infoWidth, end: 250),
            curve: Curves.elasticOut,
            from: Duration(
              milliseconds: 1400,
            ),
            to: Duration(milliseconds: 2000),
            tag: "widthAnimate")
        .addAnimatable(
            animatable: Tween<double>(begin: infoTag, end: infoTag++),
            // curve: Curves.easeOut,
            from: Duration(
              milliseconds: 2199,
            ),
            to: Duration(milliseconds: 2200),
            tag: "textChange")
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            curve: Curves.easeOut,
            from: Duration(
              milliseconds: 2200,
            ),
            to: Duration(milliseconds: 2400),
            tag: "textOpacity")
        .addAnimatable(
            animatable: Tween<double>(begin: 1, end: 0),
            curve: Curves.easeOut,
            from: Duration(
              milliseconds: 3600,
            ),
            to: Duration(milliseconds: 3800),
            tag: "textOpacity")
        .addAnimatable(
            animatable: Tween<double>(begin: 250, end: 70),
            curve: Curves.elasticOut,
            from: Duration(
              milliseconds: 4000,
            ),
            to: Duration(milliseconds: 4600),
            tag: "widthAnimate")
        .addAnimatable(
            animatable: Tween<double>(begin: 1, end: 0),
            curve: Curves.elasticOut,
            from: Duration(
              milliseconds: 4601,
            ),
            to: Duration(milliseconds: 5500),
            tag: "posThreeAnimate")
        .addAnimatable(
            animatable: Tween<double>(begin: infoTag, end: infoTag++),
            // curve: Curves.easeOut,
            from: Duration(
              milliseconds: 5500,
            ),
            to: Duration(milliseconds: 6000),
            tag: "textChange")
        .addAnimatable(
            animatable: Tween<double>(begin: infoWidth, end: 250),
            curve: Curves.elasticOut,
            from: Duration(
              milliseconds: 5500,
            ),
            to: Duration(milliseconds: 6100),
            tag: "widthAnimate")
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            curve: Curves.easeOut,
            from: Duration(
              milliseconds: 6300,
            ),
            to: Duration(milliseconds: 6500),
            tag: "textOpacity")
        .addAnimatable(
            animatable: Tween<double>(begin: 1, end: 0),
            curve: Curves.easeOut,
            from: Duration(
              milliseconds: 7700,
            ),
            to: Duration(milliseconds: 7900),
            tag: "textOpacity")
        .addAnimatable(
            animatable: Tween<double>(begin: 250, end: 70),
            curve: Curves.elasticOut,
            from: Duration(
              milliseconds: 8100,
            ),
            to: Duration(milliseconds: 8700),
            tag: "widthAnimate")
        .addAnimatable(
            animatable: Tween<double>(begin: infoTag, end: infoTag++),

            ///curve: Curves.easeOut,
            from: Duration(
              milliseconds: 8700,
            ),
            to: Duration(milliseconds: 8701),
            tag: "textChange")
        .addAnimatable(
            animatable: Tween<double>(begin: 1, end: 0),
            curve: Curves.elasticOut,
            from: Duration(
              milliseconds: 8701,
            ),
            to: Duration(milliseconds: 9600),
            tag: "posTwoAnimate")
        .addAnimatable(
            animatable: Tween<double>(begin: infoWidth, end: 250),
            curve: Curves.elasticOut,
            from: Duration(
              milliseconds: 9600,
            ),
            to: Duration(milliseconds: 10200),
            tag: "widthAnimate")
        .addAnimatable(
            animatable: Tween<double>(begin: infoTag, end: infoTag++),

            ///curve: Curves.easeOut,
            from: Duration(
              milliseconds: 10398,
            ),
            to: Duration(milliseconds: 10399),
            tag: "textChange")
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            curve: Curves.easeOut,
            from: Duration(
              milliseconds: 10400,
            ),
            to: Duration(milliseconds: 10800),
            tag: "textOpacity")
        .addAnimatable(
            animatable: Tween<double>(begin: 1, end: 0),
            curve: Curves.easeOut,
            from: Duration(
              milliseconds: 11800,
            ),
            to: Duration(milliseconds: 12000),
            tag: "textOpacity")
        .addAnimatable(
            animatable: Tween<double>(begin: 250, end: 70),
            curve: Curves.elasticOut,
            from: Duration(
              milliseconds: 12200,
            ),
            to: Duration(milliseconds: 12800),
            tag: "widthAnimate")
        .addAnimatable(
            animatable: Tween<double>(begin: 70, end: 70),
            curve: Curves.elasticOut,
            from: Duration(
              milliseconds: 12800,
            ),
            to: Duration(milliseconds: 12801),
            tag: "widthAnimate")
        .animate(_tutAnimationController);

    infoWidth = 70;
  }

  Future navigateToCreateNewTask(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddTaskWithoutCal()));
  }

  @override
  void dispose() {
    super.dispose();
    _lightToDarkAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    infoWidth = 70;
    return AnimatedBuilder(
      animation: _lightToDarkAnimationController,
      builder: (context, child) => Scaffold(
        backgroundColor: _lightToDarkBgColorTween
            .value, //darkMode ? Colors.grey[850] : Colors.grey[300]
        body: Stack(
          children: <Widget>[
            Positioned(
                top: 40,
                left: 30,
                child: Container(
                  color: Colors.transparent,
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
                        child: AnimatedBuilder(
                          animation: _lightToDarkAnimationController,
                          builder: (context, child) => Text(
                            "Firenote",
                            style: TextStyle(
                                fontSize: 40,
                                fontFamily: 'Pacifico',
                                color: _lightToDarkFontColorTween.value),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Positioned(
              left: width * 0.10,
              top: height * 0.20,
              child: AnimatedBuilder(
                animation: _lightToDarkAnimationController,
                builder: (context, child) => Opacity(
                  opacity: 1.0,
                  child: Container(
                    height: height * 0.35,
                    width: width * 0.45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _lightToDarkCardColorTween
                            .value, // darkMode ? Colors.grey[850] : Colors.grey[300],
                        boxShadow: [
                          BoxShadow(
                            color: _lightToDarkPrimaryShadowColorTween.value,
                            offset: Offset(4, 4),
                            spreadRadius: 1.0,
                            blurRadius: 15,
                          ),
                          BoxShadow(
                              color:
                                  _lightToDarkSecondaryShadowColorTween.value,
                              offset: Offset(-4.0, -4.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0),
                        ]),
                    child: new Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Container(
                            height: (height * 0.35) / 4,
                            child: LeftRightAlign(
                              left: Text(
                                "Plan",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: 'Pacifico',
                                  fontSize: 40,
                                  color: _lightToDarkFontColorTween.value,
                                ),
                              ),
                              right: Text(""),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Container(
                            height: (height * 0.35) / 4,
                            child: LeftRightAlign(
                              left: Text(
                                "Your",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: 'Pacifico',
                                  fontSize: 40,
                                  color: _lightToDarkFontColorTween.value,
                                ),
                              ),
                              right: Text(""),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Container(
                            height: (height * 0.35) / 4,
                            child: LeftRightAlign(
                              left: Text(
                                "Task",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: 'Pacifico',
                                  fontSize: 40,
                                  color: _lightToDarkFontColorTween.value,
                                ),
                              ),
                              right: Text(""),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Container(
                            height: (height * 0.35) / 4,
                            child: LeftRightAlign(
                              left: Text(
                                "Everyday",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: 'Pacifico',
                                  fontSize: 40,
                                  color: _lightToDarkFontColorTween.value,
                                ),
                              ),
                              right: Text(""),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: height * 0.20,
              right: 30,
              child: AnimatedBuilder(
                animation: _lightToDarkAnimationController,
                builder: (context, child) => new Container(
                  height: height * 0.35,
                  width: width * 0.20,
                  child: new Column(
                    children: <Widget>[
                      Container(
                        height: (height * 0.35) / 3,
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              navigateToCreateNewTask(context);
                            },
                            child: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color:
                                        _lightToDarkPrimaryCardColorTween.value,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              _lightToDarkPrimaryShadowColorTween
                                                  .value,
                                          offset: Offset(4.0, 4.0),
                                          blurRadius: 15.0,
                                          spreadRadius: 1.0),
                                      BoxShadow(
                                          color:
                                              _lightToDarkSecondaryShadowColorTween
                                                  .value,
                                          offset: Offset(-4.0, -4.0),
                                          blurRadius: 15.0,
                                          spreadRadius: 1.0),
                                    ]),
                                child: Tab(
                                    icon: Icon(
                                  CustIcons.SunMoonAddCal.plus_outline,
                                  color: Colors.white,
                                  size: 35,
                                ))),
                          ),
                        ),
                      ),
                      Container(
                        height: (height * 0.35) / 3,
                        child: Center(
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                color: _lightToDarkPrimaryCardColorTween.value,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                boxShadow: [
                                  BoxShadow(
                                      color: _lightToDarkPrimaryShadowColorTween
                                          .value,
                                      offset: Offset(4.0, 4.0),
                                      blurRadius: 15.0,
                                      spreadRadius: 1.0),
                                  BoxShadow(
                                      color:
                                          _lightToDarkSecondaryShadowColorTween
                                              .value,
                                      offset: Offset(-4.0, -4.0),
                                      blurRadius: 15.0,
                                      spreadRadius: 1.0),
                                ]),
                            child: Tab(
                                icon: Icon(
                              CustIcons.SunMoonAddCal.cal,
                              color: Colors.white,
                              size: 35,
                            )),
                          ),
                        ),
                      ),
                      Container(
                        height: (height * 0.35) / 3,
                        child: Center(
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                color: _lightToDarkPrimaryCardColorTween.value,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                boxShadow: [
                                  BoxShadow(
                                      color: _lightToDarkPrimaryShadowColorTween
                                          .value,
                                      offset: Offset(4.0, 4.0),
                                      blurRadius: 15.0,
                                      spreadRadius: 1.0),
                                  BoxShadow(
                                      color:
                                          _lightToDarkSecondaryShadowColorTween
                                              .value,
                                      offset: Offset(-4.0, -4.0),
                                      blurRadius: 15.0,
                                      spreadRadius: 1.0),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (darkMode == true) {
                                        darkMode = false;
                                        fontcolor = Colors.black;
                                        moonSun = CustIcons.SunMoonAddCal.moon;
                                        _lightToDarkAnimationController
                                            .reverse();
                                      } else {
                                        darkMode = true;
                                        fontcolor = Colors.white;
                                        moonSun = CustIcons.SunMoonAddCal.sun;
                                        _lightToDarkAnimationController
                                            .forward();
                                      }
                                    });
                                  },
                                  child: Tab(
                                      icon: Icon(
                                    moonSun,
                                    color: Colors.white,
                                    size: 35,
                                  )),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: width * 0.10,
              top: height * 0.60,
              child: AnimatedBuilder(
                animation: _lightToDarkAnimationController,
                builder: (context, child) => Opacity(
                  opacity: 1.0,
                                  child: Container(
                    height: height * 0.20,
                    width: width * 0.70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _lightToDarkCardColorTween
                            .value, //darkMode ? Colors.grey[850] : Colors.grey[300],
                        boxShadow: [
                          BoxShadow(
                            color: _lightToDarkPrimaryShadowColorTween
                                .value, //darkMode ? Colors.black54 : Colors.grey[500],
                            offset: Offset(4, 4),
                            spreadRadius: 1.0,
                            blurRadius: 15,
                          ),
                          BoxShadow(
                            color: _lightToDarkSecondaryShadowColorTween
                                .value, //darkMode ? Colors.grey[800] : Colors.white,
                            offset: Offset(-4, -4),
                            spreadRadius: 1,
                            blurRadius: 15,
                          ),
                        ]),
                    child: new Column(
                      children: <Widget>[
                        new Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Container(
                            child: LeftRightAlign(
                                left: Text(
                                  "Words of Life...",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Pacifico',
                                    color: _lightToDarkFontColorTween.value,
                                  ),
                                ),
                                right: Text("")),
                          ),
                        ),
                        new Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Container(
                            child: LeftRightAlign(
                              left: Text(
                                quotes[2],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Pacifico',
                                  color: _lightToDarkFontColorTween.value,
                                ),
                              ),
                              right: Text(""),
                            ),
                          ),
                        ),
                        new Padding(
                          padding: EdgeInsets.only(right: 20, top: 10),
                          child: Container(
                            child: LeftRightAlign(
                              left: Text(""),
                              right: Text(
                                "- Mahesh Kumawat",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Pacifico',
                                  color: _lightToDarkFontColorTween.value,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: width * 0.10,
              bottom: height * 0.07,
              child: AnimatedBuilder(
                animation: _lightToDarkAnimationController,
                builder: (context, child) => Container(
                    height: 60,
                    width: 240,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: _lightToDarkPrimaryCardColorTween.value,
                        boxShadow: [
                          BoxShadow(
                            color: _lightToDarkPrimaryShadowColorTween.value,
                            offset: Offset(4, 4),
                            spreadRadius: 1.0,
                            blurRadius: 15,
                          ),
                          BoxShadow(
                            color: _lightToDarkSecondaryShadowColorTween
                                .value, // darkMode ? Colors.grey[800] : Colors.white,
                            offset: Offset(-4, -4),
                            spreadRadius: 1,
                            blurRadius: 15,
                          ),
                        ]),
                    child: GestureDetector(
                      onTap: () {
                        if (AnimationStatus.completed ==
                            _tutAnimationController.status) {
                          _tutAnimationController.repeat();
                        } else {
                          _tutAnimationController.forward();
                          print(width);
                        }
                      },
                      child: Center(
                        child: Container(
                          child: new Text(
                            "Plan my day",
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Pacifico',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )),
              ),
            ),
            Positioned(
              top: height * 0.20,
              left: -9000,
              child: Container(
                width: 800,
                height: height * 0.35,
                color: Colors.transparent,
                child: Row(
                  children: <Widget>[
                    AnimatedBuilder(
                      animation: _tutAnimationController,
                      builder: (context, child) => Container(
                        transform: Matrix4.translationValues(
                            (width * 0.70) -
                                _tutLengthAnimation["widthAnimate"].value,
                            (((height * 0.35) / 3) * posOne -
                                        ((height * 0.35) / 3) *
                                            _tutLengthAnimation["posTwoAnimate"]
                                                .value - //_tutLengthAnimation["posTwoAnimate"].value
                                        ((height * 0.35) / 3) *
                                            _tutLengthAnimation[
                                                    "posThreeAnimate"]
                                                .value) *
                                    1 -
                                _tutLengthAnimation["topBottom"].value,
                            0.0),
                        height: 70,
                        width: _tutLengthAnimation["widthAnimate"]
                            .value, // to animate width we will keep it in a variable which will affact above transform's x acces where it is written as -70
                        decoration: BoxDecoration(
                            color: _lightToDarkPrimaryCardColorTween.value,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      _lightToDarkPrimaryShadowColorTween.value,
                                  offset: Offset(4.0, 4.0),
                                  blurRadius: 15.0,
                                  spreadRadius: 1.0),
                              BoxShadow(
                                  color: _lightToDarkSecondaryShadowColorTween
                                      .value,
                                  offset: Offset(-4.0, -4.0),
                                  blurRadius: 15.0,
                                  spreadRadius: 1.0),
                            ]),
                        child: LeftRightAlign(
                            left: new Text(""),
                            right: Container(
                              height: 70,
                              // width: 70,
                              margin: EdgeInsets.only(right: 20),
                              child: Tab(
                                  icon: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 30,
                              )),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: height * 0.20,
              left: -9000,
              child: Container(
                width: 800,
                height: height * 0.35,
                color: Colors.transparent,
                child: Row(
                  children: <Widget>[
                    AnimatedBuilder(
                      animation: _tutAnimationController,
                      builder: (context, child) => Container(
                        transform: Matrix4.translationValues(
                            (width * 0.70) -
                                _tutLengthAnimation["widthAnimate"].value,
                            (((height * 0.35) / 3) * posOne -
                                        ((height * 0.35) / 3) *
                                            _tutLengthAnimation["posTwoAnimate"]
                                                .value -
                                        ((height * 0.35) / 3) *
                                            _tutLengthAnimation[
                                                    "posThreeAnimate"]
                                                .value) *
                                    1 -
                                _tutLengthAnimation["topBottom"].value,
                            0.0),
                        height: 70,
                        width: _tutLengthAnimation["widthAnimate"]
                            .value, // to animate width we will keep it in a variable which will affact above transform's x acces where it is written as -70
                        color: Colors.transparent,
                        child: LeftRightAlign(
                          left: Opacity(
                            opacity: _tutLengthAnimation["textOpacity"].value,
                            child: Container(
                              margin: EdgeInsets.only(top: 13, left: 22),
                              height: 70,
                              color: Colors.transparent,
                              child: Text(
                                _tutLengthAnimation["textChange"].value == 1
                                    ? "Plan by Days"
                                    : _tutLengthAnimation["textChange"].value ==
                                            2
                                        ? "Plan by Dates"
                                        : "Night mode",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Pacifico',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          right: Text(""),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

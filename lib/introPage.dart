import 'package:flutter/material.dart';
import 'package:todo/addTaskWithoutCal.dart';
import 'LeftRightAlign.dart';
import 'Quotes.dart';
import 'dart:math';
import 'addTaskWithCal.dart';
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
  double animatePlateOne = -0.19,
      animatePlateTwo = -0.19,
      animatePlateThree = -0.33;
  var moonSun = CustIcons.SunMoonAddCal.moon;

  AnimationController _lightToDarkAnimationController;
  Animation _lightToDarkBgColorTween;
  Animation _lightToDarkFontColorTween;
  Animation _lightToDarkCardColorTween;
  Animation _lightToDarkPrimaryCardColorTween;
  Animation _lightToDarkPrimaryShadowColorTween;
  Animation _lightToDarkSecondaryShadowColorTween;

  SequenceAnimation _vanishIntroAnimation;
  SequenceAnimation _tutLengthAnimation;
  AnimationController _vanishIntroAnimationController;
  AnimationController _tutAnimationController;
  AnimationController _infoOpacityAnimationController;
  Animation _infoOpacityAnimation;

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

    _infoOpacityAnimationController = AnimationController(
        vsync: this,
        duration: new Duration(
          milliseconds: 1000,
        ));
    _infoOpacityAnimation = Tween<double>(begin: 0, end: 1)
        .animate(_infoOpacityAnimationController);
    _lightToDarkAnimationController = AnimationController(
        vsync: this,
        duration: new Duration(
          milliseconds: 400,
        ));
    _lightToDarkBgColorTween = ColorTween(
            begin: Color.fromRGBO(229, 241, 250, 1), end: Colors.grey[850])
        .animate(_lightToDarkAnimationController);

    _lightToDarkCardColorTween = ColorTween(
            begin: Color.fromRGBO(229, 241, 250, 1), end: Colors.grey[850])
        .animate(_lightToDarkAnimationController);

    _lightToDarkPrimaryCardColorTween = ColorTween(
            begin: Color.fromRGBO(245, 52, 86, 0.9), end: Colors.grey[850])
        .animate(_lightToDarkAnimationController);

    _lightToDarkFontColorTween =
        ColorTween(begin: Colors.black, end: Colors.white)
            .animate(_lightToDarkAnimationController);

    _lightToDarkPrimaryShadowColorTween =
        ColorTween(begin: Color.fromRGBO(202, 224, 238, 1), end: Colors.black54)
            .animate(_lightToDarkAnimationController);

    _lightToDarkSecondaryShadowColorTween = ColorTween(
            begin: Color.fromRGBO(243, 249, 253, 1), end: Colors.grey[800])
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
              milliseconds: 1000,
            ),
            to: Duration(milliseconds: 2200),
            tag: "topBottom")
        .addAnimatable(
            curve: Curves.elasticOut,
            animatable: Tween(begin: animatePlateOne, end: 0.33),
            from: Duration(
              milliseconds: 1000,
            ),
            to: Duration(milliseconds: 2200),
            tag: "discriptionPlateOne")
        .addAnimatable(
            animatable: Tween<double>(begin: infoWidth, end: 250),
            curve: Curves.elasticOut,
            from: Duration(
              milliseconds: 2400,
            ),
            to: Duration(milliseconds: 3000),
            tag: "widthAnimate")
        .addAnimatable(
            animatable: Tween<double>(begin: infoTag, end: infoTag++),
            // curve: Curves.easeOut,
            from: Duration(
              milliseconds: 3199,
            ),
            to: Duration(milliseconds: 3200),
            tag: "textChange")
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            curve: Curves.easeOut,
            from: Duration(
              milliseconds: 3200,
            ),
            to: Duration(milliseconds: 3400),
            tag: "textOpacity")
        .addAnimatable(
            animatable: Tween<double>(begin: 1, end: 0),
            curve: Curves.easeOut,
            from: Duration(
              milliseconds: 4600,
            ),
            to: Duration(milliseconds: 4800),
            tag: "textOpacity")
        .addAnimatable(
            animatable: Tween<double>(begin: 250, end: 70),
            curve: Curves.elasticOut,
            from: Duration(
              milliseconds: 5000,
            ),
            to: Duration(milliseconds: 5600),
            tag: "widthAnimate")
        .addAnimatable(
            animatable: Tween<double>(begin: 1, end: 0),
            curve: Curves.elasticOut,
            from: Duration(
              milliseconds: 5601,
            ),
            to: Duration(milliseconds: 6500),
            tag: "posThreeAnimate")
        .addAnimatable(
            animatable: Tween<double>(begin: animatePlateTwo, end: 0.19),
            curve: Curves.elasticOut,
            from: Duration(
              milliseconds: 5601,
            ),
            to: Duration(milliseconds: 6500),
            tag: "discriptionPlateTwo")
        .addAnimatable(
            animatable: Tween<double>(begin: infoTag, end: infoTag++),
            // curve: Curves.easeOut,
            from: Duration(
              milliseconds: 6500,
            ),
            to: Duration(milliseconds: 7000),
            tag: "textChange")
        .addAnimatable(
            animatable: Tween<double>(begin: infoWidth, end: 250),
            curve: Curves.elasticOut,
            from: Duration(
              milliseconds: 6500,
            ),
            to: Duration(milliseconds: 7100),
            tag: "widthAnimate")
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            curve: Curves.easeOut,
            from: Duration(
              milliseconds: 7300,
            ),
            to: Duration(milliseconds: 7500),
            tag: "textOpacity")
        .addAnimatable(
            animatable: Tween<double>(begin: 1, end: 0),
            curve: Curves.easeOut,
            from: Duration(
              milliseconds: 8700,
            ),
            to: Duration(milliseconds: 8900),
            tag: "textOpacity")
        .addAnimatable(
            animatable: Tween<double>(begin: 250, end: 70),
            curve: Curves.elasticOut,
            from: Duration(
              milliseconds: 9100,
            ),
            to: Duration(milliseconds: 9700),
            tag: "widthAnimate")
        .addAnimatable(
            animatable: Tween<double>(begin: infoTag, end: infoTag++),

            ///curve: Curves.easeOut,
            from: Duration(
              milliseconds: 9700,
            ),
            to: Duration(milliseconds: 9701),
            tag: "textChange")
        .addAnimatable(
            animatable: Tween<double>(begin: 1, end: 0),
            curve: Curves.elasticOut,
            from: Duration(
              milliseconds: 9701,
            ),
            to: Duration(milliseconds: 10600),
            tag: "posTwoAnimate")
        .addAnimatable(
            animatable: Tween<double>(begin: animatePlateThree, end: 0.05),
            curve: Curves.elasticOut,
            from: Duration(
              milliseconds: 9701,
            ),
            to: Duration(milliseconds: 10600),
            tag: "discriptionPlateThree")
        .addAnimatable(
            animatable: Tween<double>(begin: infoWidth, end: 250),
            curve: Curves.elasticOut,
            from: Duration(
              milliseconds: 10600,
            ),
            to: Duration(milliseconds: 11200),
            tag: "widthAnimate")
        .addAnimatable(
            animatable: Tween<double>(begin: infoTag, end: infoTag++),

            ///curve: Curves.easeOut,
            from: Duration(
              milliseconds: 11398,
            ),
            to: Duration(milliseconds: 11399),
            tag: "textChange")
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            curve: Curves.easeOut,
            from: Duration(
              milliseconds: 11400,
            ),
            to: Duration(milliseconds: 11800),
            tag: "textOpacity")
        .addAnimatable(
            animatable: Tween<double>(begin: 1, end: 0),
            curve: Curves.easeOut,
            from: Duration(
              milliseconds: 12800,
            ),
            to: Duration(milliseconds: 13000),
            tag: "textOpacity")
        .addAnimatable(
            animatable: Tween<double>(begin: 250, end: 70),
            curve: Curves.elasticOut,
            from: Duration(
              milliseconds: 13200,
            ),
            to: Duration(milliseconds: 13800),
            tag: "widthAnimate")
        .addAnimatable(
            animatable: Tween<double>(begin: 70, end: 70),
            curve: Curves.elasticOut,
            from: Duration(
              milliseconds: 13800,
            ),
            to: Duration(milliseconds: 13801),
            tag: "widthAnimate")
        .animate(_tutAnimationController);

    //_vanishIntroAnimation
    _vanishIntroAnimationController = AnimationController(vsync: this);
    _vanishIntroAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 400),
            curve: Curves.easeIn,
            from: Duration(
              milliseconds: 0,
            ),
            to: Duration(milliseconds: 500),
            tag: "infoBall")
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 800),
            curve: Curves.easeOut,
            from: Duration(
              milliseconds: 500,
            ),
            to: Duration(milliseconds: 1500),
            tag: "PlateOne")
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 800),
            curve: Curves.easeOut,
            from: Duration(
              milliseconds: 1000,
            ),
            to: Duration(milliseconds: 2000),
            tag: "PlateTwo")
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 800),
            curve: Curves.easeOut,
            from: Duration(
              milliseconds: 1500,
            ),
            to: Duration(milliseconds: 2500),
            tag: "PlateThree")
        .animate(_vanishIntroAnimationController);
    _vanishIntroAnimationController.addListener(() {
      setState(() {
        if (_vanishIntroAnimationController.isCompleted) {
          //infoOpacityAinamtion
          _infoOpacityAnimationController.forward();
        }
      });
    });
    _infoOpacityAnimationController.addListener(() {
      setState(() {});
    });
    infoWidth = 70;
    // _tutAnimationController.forward();
    _infoOpacityAnimationController.forward();
    _vanishIntroAnimationController.forward();
  }

  Future navigateToNewTaskWithoutCal(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddTaskWithoutCal()));
  }

  Future navigateToNewTaskWithCal(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddTaskWithCal()));
  }

  @override
  void dispose() {
    super.dispose();
    _lightToDarkAnimationController.dispose();
    _vanishIntroAnimationController.dispose();
    _tutAnimationController.dispose();
    _infoOpacityAnimationController.dispose();
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
                  opacity: _infoOpacityAnimation.value,
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
                              offset: Offset(14.0, 14.0),
                              blurRadius: 25.0,
                              spreadRadius: 5.0),
                          BoxShadow(
                              color:
                                  _lightToDarkSecondaryShadowColorTween.value,
                              offset: Offset(-14.0, -14.0),
                              blurRadius: 25.0,
                              spreadRadius: 5.0),
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
                              navigateToNewTaskWithoutCal(context);
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
                                          offset: Offset(14.0, 14.0),
                                          blurRadius: 25.0,
                                          spreadRadius: 5.0),
                                      BoxShadow(
                                          color:
                                              _lightToDarkSecondaryShadowColorTween
                                                  .value,
                                          offset: Offset(-14.0, -14.0),
                                          blurRadius: 25.0,
                                          spreadRadius: 5.0),
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
                          child: GestureDetector(
                            onTap: () {
                              navigateToNewTaskWithCal(context);
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
                                        offset: Offset(14.0, 14.0),
                                        blurRadius: 25.0,
                                        spreadRadius: 5.0),
                                    BoxShadow(
                                        color:
                                            _lightToDarkSecondaryShadowColorTween
                                                .value,
                                        offset: Offset(-14.0, -14.0),
                                        blurRadius: 25.0,
                                        spreadRadius: 5.0),
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
                                      offset: Offset(14.0, 14.0),
                                      blurRadius: 25.0,
                                      spreadRadius: 5.0),
                                  BoxShadow(
                                      color:
                                          _lightToDarkSecondaryShadowColorTween
                                              .value,
                                      offset: Offset(-14.0, -14.0),
                                      blurRadius: 25.0,
                                      spreadRadius: 5.0),
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
                  opacity: _infoOpacityAnimation.value,
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
                              offset: Offset(14.0, 14.0),
                              blurRadius: 25.0,
                              spreadRadius: 5.0),
                          BoxShadow(
                              color: _lightToDarkSecondaryShadowColorTween
                                  .value, //darkMode ? Colors.grey[800] : Colors.white,
                              offset: Offset(-14.0, -14.0),
                              blurRadius: 25.0,
                              spreadRadius: 5.0),
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
                builder: (context, child) => Opacity(
                  opacity: _infoOpacityAnimation.value,
                  child: Container(
                      height: 60,
                      width: 240,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: _lightToDarkPrimaryCardColorTween.value,
                          boxShadow: [
                            BoxShadow(
                                color:
                                    _lightToDarkPrimaryShadowColorTween.value,
                                offset: Offset(14.0, 14.0),
                                blurRadius: 25.0,
                                spreadRadius: 5.0),
                            BoxShadow(
                                color: _lightToDarkSecondaryShadowColorTween
                                    .value, // darkMode ? Colors.grey[800] : Colors.white,
                                offset: Offset(-14.0, -14.0),
                                blurRadius: 25.0,
                                spreadRadius: 5.0),
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
            ),
            Positioned(
              top: height * 0.20,
              left: _vanishIntroAnimation["infoBall"].value,
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
                                  offset: Offset(14.0, 14.0),
                                  blurRadius: 25.0,
                                  spreadRadius: 5.0),
                              BoxShadow(
                                  color: _lightToDarkSecondaryShadowColorTween
                                      .value,
                                  offset: Offset(-14.0, -14.0),
                                  blurRadius: 25.0,
                                  spreadRadius: 5.0),
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
              left: _vanishIntroAnimation["infoBall"].value,
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
            ),
            AnimatedBuilder(
              animation: _tutAnimationController,
              builder: (context, child) => Positioned(
                left: width * 0.05,
                right: (width * 0.05) + _vanishIntroAnimation["PlateOne"].value,
                bottom:
                    height * _tutLengthAnimation["discriptionPlateOne"].value,
                child: AnimatedBuilder(
                  animation: _lightToDarkAnimationController,
                  builder: (context, child) => GestureDetector(
                    onTap: () {
                      _vanishIntroAnimationController.forward();
                    },
                    child: Container(
                      height: 90,
                      width: width * 0.90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _lightToDarkPrimaryCardColorTween.value,
                          boxShadow: [
                            BoxShadow(
                                color:
                                    _lightToDarkPrimaryShadowColorTween.value,
                                offset: Offset(14.0, 14.0),
                                blurRadius: 25.0,
                                spreadRadius: 5.0),
                            BoxShadow(
                                color: _lightToDarkSecondaryShadowColorTween
                                    .value, // darkMode ? Colors.grey[800] : Colors.white,
                                offset: Offset(-14.0, -14.0),
                                blurRadius: 25.0,
                                spreadRadius: 5.0),
                          ]),
                      child: new Padding(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: Container(
                          child: LeftRightAlign(
                            left: Text(
                              "If you do not know the date of event, Dont worry Plan by Days can halp you",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Pacifico',
                                color: Colors.white,
                              ),
                            ),
                            right: Text(""),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ), //0.033  infoPalat(
            // _tutLengthAnimation["discriptionPlateTwo"].value,
            // 90,
            // "If you do not know the date of event, Dont worry Plan by Days can halp you"),
            AnimatedBuilder(
              animation: _tutAnimationController,
              builder: (context, child) => Positioned(
                left: width * 0.05,
                right: (width * 0.05) + _vanishIntroAnimation["PlateTwo"].value,
                bottom:
                    height * _tutLengthAnimation["discriptionPlateTwo"].value,
                child: AnimatedBuilder(
                  animation: _lightToDarkAnimationController,
                  builder: (context, child) => GestureDetector(
                    onTap: () {
                      _vanishIntroAnimationController.forward();
                    },
                    child: Container(
                      height: 90,
                      width: width * 0.90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _lightToDarkPrimaryCardColorTween.value,
                          boxShadow: [
                            BoxShadow(
                                color:
                                    _lightToDarkPrimaryShadowColorTween.value,
                                offset: Offset(14.0, 14.0),
                                blurRadius: 25.0,
                                spreadRadius: 5.0),
                            BoxShadow(
                                color: _lightToDarkSecondaryShadowColorTween
                                    .value, // darkMode ? Colors.grey[800] : Colors.white,
                                offset: Offset(-14.0, -14.0),
                                blurRadius: 25.0,
                                spreadRadius: 5.0),
                          ]),
                      child: new Padding(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: Container(
                          child: LeftRightAlign(
                            left: Text(
                              "Dont Worry if you dont know the Days left for event, just use Plan by Date",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Pacifico',
                                color: Colors.white,
                              ),
                            ),
                            right: Text(""),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ), //0.19  infoPalat(
            // _tutLengthAnimation["discriptionPlateTwo"].value,
            // 90,
            // "Dont Worry if you dont know the Days of event, just use Plan by Date"),
            AnimatedBuilder(
              animation: _tutAnimationController,
              builder: (context, child) => Positioned(
                left: width * 0.05,
                right:
                    (width * 0.05) + _vanishIntroAnimation["PlateThree"].value,
                bottom:
                    height * _tutLengthAnimation["discriptionPlateThree"].value,
                child: AnimatedBuilder(
                  animation: _lightToDarkAnimationController,
                  builder: (context, child) => GestureDetector(
                    onTap: () {
                      _vanishIntroAnimationController.forward();
                    },
                    child: Container(
                      height: 90,
                      width: width * 0.90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _lightToDarkPrimaryCardColorTween.value,
                          boxShadow: [
                            BoxShadow(
                                color:
                                    _lightToDarkPrimaryShadowColorTween.value,
                                offset: Offset(14.0, 14.0),
                                blurRadius: 25.0,
                                spreadRadius: 5.0),
                            BoxShadow(
                                color: _lightToDarkSecondaryShadowColorTween
                                    .value, // darkMode ? Colors.grey[800] : Colors.white,
                                offset: Offset(-14.0, -14.0),
                                blurRadius: 25.0,
                                spreadRadius: 5.0),
                          ]),
                      child: new Padding(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: Container(
                          child: LeftRightAlign(
                            left: Text(
                              "Night mode can be used at night time which makes app to use at night ",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Pacifico',
                                color: Colors.white,
                              ),
                            ),
                            right: Text(""),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ), //0.05  infoPalat(
            // _tutLengthAnimation["discriptionPlateTwo"].value,
            // 90,
            // "Night mode can be used at night time which makes app to use at night ")
          ],
        ),
      ),
    );
  }
}

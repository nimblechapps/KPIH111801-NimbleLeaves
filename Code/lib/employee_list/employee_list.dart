import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:nimble_leaves/custom_icons_icons.dart';
import 'package:nimble_leaves/employee_list/add_employee.dart';
import 'package:nimble_leaves/menu/menu.dart';
import 'package:material_search/material_search.dart';
import 'package:flutter/animation.dart';

const active = const Color.fromRGBO(78, 125, 254, 1);
const greydark = const Color.fromRGBO(119, 140, 161, 1);
const greylight = const Color.fromRGBO(237, 237, 237, 1);

class SecondScreen extends StatefulWidget {
  SecondScreen({Key key, this.duration}) : super(key: key);

  final Duration duration;

  @override
  _SecondScreenpage createState() => _SecondScreenpage();
}

class _SecondScreenpage extends State<SecondScreen>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _names = [
    'Igor Minar',
    'Brad Green',
    'Dave Geddes',
    'Naomi Black',
    'Greg Weber',
    'Dean Sofer',
    'Wes Alvaro',
    'John Scott',
    'Daniel Nadasi',
  ];
  Animation animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 5000), vsync: this);

    animation = Tween(begin: 0.0, end: 25.0).animate(controller);
    controller.forward();
  }

  Flushbar flush;
  bool _wasButtonClicked;
  final _formKey = new GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return new Scaffold(
      endDrawer: new DrawerOnly(),
      key: _scaffoldKey,
      appBar: new AppBar(
          brightness: Brightness.light,
          automaticallyImplyLeading: false,
          leading: new Container(
            child: Image.asset('images/logo.png'),
            padding: EdgeInsets.only(left: 5, top: 5),
          ),
          title: MediaQuery.of(context).size.width <= 767
              ? null
              : new DrawerOnly(),
          backgroundColor: Color.fromRGBO(248, 250, 251, 1),
          elevation: 0.0,
          actions: MediaQuery.of(context).size.width <= 767
              ? <Widget>[
                  Column(
                    children: <Widget>[
                      new Text(
                        '06',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(78, 125, 254, 1),
                            fontSize: 27,
                            height: 1,
                            fontFamily: 'SairaSemiCondensed'),
                      ),
                      new Text(
                        'DEC',
                        style: TextStyle(
                            color: Color.fromRGBO(78, 125, 254, 1),
                            fontSize: 18,
                            height: 0.2,
                            fontFamily: 'SairaSemiCondensed'),
                      ),
                    ],
                  ),
                  IconButton(
                      icon: Icon(CustomIcons.menunew),
                      color: Colors.blueGrey,
                      onPressed: () =>
                          _scaffoldKey.currentState.openEndDrawer()),
                  Padding(
                    padding: EdgeInsets.only(right: 4),
                  )
                ]
              : <Widget>[
                  Column(
                    children: <Widget>[
                      new Text(
                        '06',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(78, 125, 254, 1),
                            fontSize: 27,
                            height: 1,
                            fontFamily: 'SairaSemiCondensed'),
                      ),
                      new Text(
                        'DEC',
                        style: TextStyle(
                            color: Color.fromRGBO(78, 125, 254, 1),
                            fontSize: 18,
                            height: 0.4,
                            fontFamily: 'SairaSemiCondensed'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                  )
                ]),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 15.0),
                child: new Row(
                  children: <Widget>[
                    new Container(
                      padding:
                          const EdgeInsets.only(left: 10, top: 4, bottom: 3),
                      decoration: new BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.grey,
                              blurRadius: 4.0,
                            ),
                          ],
                          borderRadius: new BorderRadius.circular(5)),
                      width: getwidth(context),
                      // MediaQuery.of(context).size.width < 767
                      //     ? MediaQuery.of(context).size.width * 0.76
                      //     : MediaQuery.of(context).size.width * 0.88,
                      child: new Form(
                        key: _formKey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Icon(
                                  Icons.search,
                                  color: greydark,
                                ),
                                new SizedBox(
                                  width: MediaQuery.of(context).size.width <=
                                          330
                                      ? MediaQuery.of(context).size.width * 0.4
                                      : MediaQuery.of(context).size.width * .6,
                                  child:
                                      //  new TextField(
                                      //   keyboardType: TextInputType.text,
                                      //   decoration: new InputDecoration(
                                      //     border: InputBorder.none,
                                      //     hintText: 'Search',
                                      //   ),
                                      // ),

                                      new MaterialSearchInput<String>(
                                    placeholder: ' Search',
                                    results: _names
                                        .map((String v) =>
                                            new MaterialSearchResult<String>(
                                              value: v,
                                              text: "Mr(s). $v",
                                            ))
                                        .toList(),
                                    filter: (dynamic value, String criteria) {
                                      return value
                                          .toLowerCase()
                                          .trim()
                                          .contains(new RegExp(r'' +
                                              criteria.toLowerCase().trim() +
                                              ''));
                                    },
                                    onSelect: (dynamic v) {
                                      print(v);
                                    },
                                    validator: (dynamic value) =>
                                        value == null ? 'Required field' : null,
                                    formatter: (dynamic v) => 'Hello, $v',
                                  ),
                                )
                              ],
                            )),
                          ],
                        ),
                      ),
                    ),
                    new Container(
                        margin: const EdgeInsets.only(left: 10, right: 0),
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.grey,
                                blurRadius: 4.0,
                              ),
                            ],
                            borderRadius: new BorderRadius.circular(5)),
                        child: new IconButton(
                          icon: Icon(
                            CustomIcons.filter,
                            color: greydark,
                          ),
                          onPressed: () {
                            Flushbar(
                              flushbarPosition: FlushbarPosition.TOP,
                              aroundPadding: 0,
                              borderRadius: 5,
                              forwardAnimationCurve: Curves.linear,
                              reverseAnimationCurve: Curves.linear,
                            )
                              ..title = null
                              ..titleText = null
                              ..messageText = Text(
                                'Unplanned leave edited successfully.',
                                style: TextStyle(
                                    color: greydark,
                                    height: 0.8,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    fontFamily: 'SairaSemiCondensed'),
                              )
                              ..duration = Duration(seconds: 10)
                              ..icon = Icon(
                                CustomIcons.verified,
                                color: greydark,
                                size: 16,
                              )
                              ..mainButton = FlatButton(
                                onPressed: () {
                                  flush.dismiss(true); // result = true
                                },
                                child: Text(
                                  "Close",
                                  style: TextStyle(
                                      color: greydark,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      fontFamily: 'SairaSemiCondensed'),
                                ),
                              )
                              ..backgroundColor = Colors.red
                              ..isDismissible = true
                              ..shadowColor = Colors.grey[200]
                              ..showProgressIndicator = true
                              ..progressIndicatorBackgroundColor = active
                              ..progressIndicatorController = controller
                              ..progressIndicatorValueColor =
                                  new AlwaysStoppedAnimation<Color>(
                                      Colors.white)
                              ..forwardAnimationCurve
                              ..show(context).then((result) {
                                // setState() is optional here
                                _wasButtonClicked = result;
                              });
                          },
                        ))
                  ],
                )),
            new Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 00.0, horizontal: 00.0),
                child: new Column(children: <Widget>[
                  new Text(
                    'OOPS!',
                    style: TextStyle(
                        color: greydark,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        fontFamily: 'SairaSemiCondensed'),
                  ),
                  Text('Nothing found here.',
                      style: TextStyle(
                          color: greydark,
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          height: 0.8,
                          fontFamily: 'SairaSemiCondensed'))
                ])),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          showDialog(context: context, child: new AddEmployee());
        },
        tooltip: 'Add',
        child: new Icon(CustomIcons.add),
        backgroundColor: active,
      ),
    );
  }

  double getwidth(BuildContext context) {
    if (MediaQuery.of(context).size.width <= 340) {
      return MediaQuery.of(context).size.width * 0.72;
    } else if (MediaQuery.of(context).size.width <= 767) {
      return MediaQuery.of(context).size.width * 0.76;
    } else if (MediaQuery.of(context).size.width >= 767 &&
        MediaQuery.of(context).size.width <= 1023) {
      return MediaQuery.of(context).size.width * 0.88;
    } else {
      return MediaQuery.of(context).size.width * 0.912;
    }
  }
}

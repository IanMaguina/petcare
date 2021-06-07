import 'package:flutter/material.dart';
import 'package:petcare/const/fronts_constances.dart';
import 'package:petcare/src/Animation/FadeAnimation.dart';
import 'package:petcare/src/pages/login_page.dart';

class InitPage extends StatefulWidget {
  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800.0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 5, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 150,
            ),
            FadeAnimation(
              1.5,
              Text("Selecciona tu cuenta!",style: kButtonStyle,)
            ),
            SizedBox(
              height: 150,
            ),
            FadeAnimation(
              1.8,
              Padding(
                padding: const EdgeInsets.only(left:25.0,right: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ButtonTheme(
                      buttonColor: Colors.white,
                      minWidth: 125.0,
                      height: 150.0,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        child:Container(
                          color: Colors.white,
                          height:120 ,
                          width: 100,
                          child:Column(
                            children: <Widget>[
                              Image.asset('assets/images/pio.png',),
                              SizedBox(
                                height: 2,
                              ),
                              Text("Owner",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    ButtonTheme(
                      buttonColor: Colors.white,
                      minWidth: 125.0,
                      height: 150.0,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        child:Container(
                          color: Colors.white,
                          height:120 ,
                          width: 100,
                          child: Column(
                            children: <Widget>[
                              Image.asset('assets/images/xcxc.png',),
                              SizedBox(
                                height: 2,
                              ),
                              Text("Veterinary",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
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
import 'package:energia_app/components/constants.dart';
import 'package:energia_app/components/fadeAnimation.dart';
import 'package:energia_app/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'signupScreen.dart';

class LoginScreen extends StatefulWidget {
  final String playerID;

  const LoginScreen(this.playerID);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool phoneValid = true;
  bool passValid = true;
  String phone;
  String password;

  void obscureFuncton() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  /*  Future signIn(String pn, String pw) async {
    /* var result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: pn, password: pw);
    if (result != null) {
      return true;
    } else {
      return false;
    } */

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: "z@gmail.com", password: "123456");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
  */
  @override
  Widget build(BuildContext context) {
    print("playerId:${widget.playerID}");
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/ebackground.png'),
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.language,
                          color: kWhiteColor,
                          size: 25,
                        ),
                        onPressed: () {},
                      ),
                      Text(
                        'العربية  ',
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .copyWith(color: kWhiteColor),
                      ),
                    ],
                  ),
                ),
                FadeAnimation(
                  1,
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/logo.png'),
                      radius: 50,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                FadeAnimation(
                  0.5,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Energia Powered'.toUpperCase(),
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(fontSize: 30, color: kWhiteColor)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                FadeAnimation(
                  0.2,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('" The better is yet to come "'.toUpperCase(),
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(fontSize: 16, color: kWhiteColor)),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                Stack(
                  children: [
                    Container(
                      height: size.height * 0.75,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kgreybackground,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(50),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 30.0, bottom: 20, top: 45, left: 30),
                                child: Text(
                                  'Login'.toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .copyWith(
                                          color: kdarkBlue,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                // MOBILE NUMBER TEXT FIELD ///////////////////////////////
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 10),
                                  decoration: new BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: new BorderRadius.all(
                                          new Radius.circular(30))),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      if (value.length != 11) {
                                        setState(() {
                                          phoneValid = false;
                                          phone = null;
                                        });
                                      } else {
                                        setState(() {
                                          phoneValid = true;
                                          phone = '+2$value@energia.com';
                                        });
                                      }
                                    },
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(11),
                                    ],
                                    keyboardType: TextInputType.phone,
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(fontSize: 18),
                                    decoration: InputDecoration(
                                      hintText: 'Mobile Number',
                                      prefixIcon: Icon(
                                        Icons.phone_android,
                                        color: kdarkBlue,
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: kWhiteColor),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25.0)),
                                      ),
                                    ),
                                  ),
                                ),
                                phoneValid == false
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 50, vertical: 0),
                                            child: Text(
                                              'Enter your 11-digits phone number ',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  .copyWith(
                                                      fontSize: 13,
                                                      color: Colors.red[800]),
                                            ),
                                          )
                                        ],
                                      )
                                    : SizedBox(
                                        height: 1,
                                      ),
                                // PASSWORD TEXT FIELD ///////////////////////////////
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 10),
                                  decoration: new BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: new BorderRadius.all(
                                          new Radius.circular(30))),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      if (value.length < 6) {
                                        setState(() {
                                          passValid = false;
                                          password = null;
                                        });
                                      } else {
                                        setState(() {
                                          passValid = true;
                                          password = value;
                                        });
                                      }
                                    },
                                    keyboardType: TextInputType.visiblePassword,
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(fontSize: 18),
                                    decoration: InputDecoration(
                                      hintText: 'Password',
                                      prefixIcon: Icon(
                                        Icons.vpn_key,
                                        color: kdarkBlue,
                                      ),
                                      suffixIcon: IconButton(
                                          icon: Icon(
                                            Icons.remove_red_eye,
                                            color: _obscureText == false
                                                ? kdarkBlue
                                                : kgrey,
                                          ),
                                          onPressed: () => obscureFuncton()),
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: kWhiteColor),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25.0)),
                                      ),
                                    ),
                                    obscureText: _obscureText,
                                  ),
                                ),
                                passValid == false
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 50, vertical: 0),
                                            child: Text(
                                              'Enter at least 8 characters',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  .copyWith(
                                                      fontSize: 13,
                                                      color: Colors.red[800]),
                                            ),
                                          )
                                        ],
                                      )
                                    : SizedBox(
                                        height: 1,
                                      )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 5),
                                  child: Text(
                                    'Forget Password?',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                          // Login ////////////////////////////////////////////////
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              width: size.width * 0.55,
                              child: RaisedButton(
                                hoverColor: kgrey,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(29),
                                    side: BorderSide(color: Colors.grey)),
                                color: kBlue,
                                onPressed: () async {
                                  ///// Demo Login /////
/* 
                                  await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: phone, password: password);
                                  //////////////////////////
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => Home(),
                                    ),
                                  ); */
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  print('phone:$phone , password:$password');
                                  if (phone != null && password != null) {
                                    try {
                                      await FirebaseAuth.instance
                                          .signInWithEmailAndPassword(
                                              email: phone, password: password)
                                          .then((value) {
                                        if (value.user != null) {
                                          shared(value.user.displayName);
                                        }
                                      });

                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Home()),
                                        (Route<dynamic> route) => false,
                                      );
                                    } on FirebaseAuthException catch (e) {
                                      if (e.code == 'weak-password') {
                                        print(
                                            'The password provided is too weak.');
                                      } else if (e.code ==
                                          'email-already-in-use') {
                                        print(
                                            'The account already exists for that email.' +
                                                ' Meeeee');
                                      } else {
                                        print(e.toString() +
                                            'Firebase exception errorrr');
                                      }
                                    } on PlatformException catch (e) {
                                      print(e.toString() + ' PlatformError');
                                    } catch (e) {
                                      print(e + ' Catched error');
                                    }
                                  } else if (phone == null &&
                                      password != null) {
                                    setState(() {
                                      phoneValid = false;
                                    });
                                  } else if (phone != null &&
                                      password == null) {
                                    setState(() {
                                      passValid = false;
                                    });
                                  } else {
                                    setState(() {
                                      phoneValid = false;
                                      passValid = false;
                                    });
                                  }
                                },
                                child: Text(
                                  'Login',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(
                                          color: kWhiteColor,
                                          fontWeight: FontWeight.bold),
                                ),
                                padding: EdgeInsets.all(20),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "You don't have an account?",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .copyWith(
                                              fontSize: 18, color: kblack),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SignUpScreen(
                                                      widget.playerID)),
                                          (Route<dynamic> route) => false,
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25, vertical: 5),
                                        child: Text(
                                          'Sign Up',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              .copyWith(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: kBlue),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  shared(String userName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString('userName', userName);
  }
}

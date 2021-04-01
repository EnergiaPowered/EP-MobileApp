import 'package:energia_app/components/constants.dart';
import 'package:energia_app/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:toast/toast.dart';

class VerificationScreen extends StatefulWidget {
  final String phone, email, fname, lname, password, imageUrl;

  const VerificationScreen(
      {Key key,
      @required this.phone,
      @required this.email,
      @required this.fname,
      @required this.lname,
      @required this.password,
      @required this.imageUrl})
      : super(key: key);
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  DatabaseReference ref = FirebaseDatabase.instance.reference().child('users');
  FirebaseAuth auth = FirebaseAuth.instance;

  bool isCodeSent = false;
  String _verificationId;
  String otp;

  @override
  void initState() {
    super.initState();

    /* _onVerifyCode(); */
    verifyPhone();
  }

  /*verifyPhone() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+2${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          // ANDROID ONLY!

          // Sign the user in (or link) with the auto-generated credential
          await auth.signInWithCredential(credential);
          print('User verified successfully Done Already');
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }

          // Handle other errors
        },
        codeSent: (String verificationId, int resendToken) async {
          // Update the UI - wait for the user to enter the SMS code
          String smsCode = '111111';

          // Create a PhoneAuthCredential with the code
          PhoneAuthCredential phoneAuthCredential =
              PhoneAuthProvider.credential(
                  verificationId: verificationId, smsCode: smsCode);

          // Sign the user in (or link) with the credential
          await auth.signInWithCredential(phoneAuthCredential);
        },
        timeout: const Duration(seconds: 60),
        codeAutoRetrievalTimeout: (String verificationId) {
          // Auto-resolution timed out...
        },
      );
    } catch (e) {
      print('Erorrrrrrrrrrrrrrrrrrrrrrrrrrr');
    }
  }*/

  // Phone Number Verification Method ...............................................
  void verifyPhone() async {
    setState(() {
      isCodeSent = true;
    });

    // Phone Verification Completed automatically........................
    final PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) {
      auth.signInWithCredential(phoneAuthCredential).then((value) {
        if (value.user != null) {
          // Handle loogged in state

          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
              (Route<dynamic> route) => false);
        } else {
          Toast.show("Error validating OTP, try again", context,
              duration: Toast.LENGTH_SHORT, gravity: Toast.TOP);
        }
      }).catchError((error) {
        Toast.show("Try again in sometime", context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.TOP);
      });
    };

    // Phone Verification Failed ........................
    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      Toast.show(authException.message, context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.TOP);
      setState(() {
        isCodeSent = false;
      });
    };
    // Phone Code Sent ........................
    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      _verificationId = verificationId;
      setState(() {
        _verificationId = verificationId;
      });
    };

    // Phone Time Out ........................
    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      _verificationId = verificationId;
      setState(() {
        _verificationId = verificationId;
      });
    };

// Function to verify  ........................
    //  Change country code.................

    await auth.verifyPhoneNumber(
        phoneNumber: "+2${widget.phone}",
        timeout: const Duration(seconds: 5),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

// Phone Verification Completed on Manually Submission........................
  void _onFormSubmitted() async {
    AuthCredential _authCredential = PhoneAuthProvider.credential(
        verificationId: _verificationId, smsCode: otp);

    auth.signInWithCredential(_authCredential).then((value) {
      if (value.user != null) {
        // Handle loogged in state
        print(value.user.phoneNumber);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
            (Route<dynamic> route) => false);
      } else {
        Toast.show("Error validating OTP, try again", context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.TOP);
      }
    }).catchError((error) {
      Toast.show("Something went wrong", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.TOP);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: size.height,
            color: kdarkBlue,
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
                          Icons.arrow_back,
                          color: kWhiteColor,
                          size: 25,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/logo.png'),
                      radius: 20,
                      backgroundColor: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Energia Powered'.toUpperCase(),
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontSize: 18, color: kWhiteColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.15,
                ),
                Text(
                  'Enter your code',
                  style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.bold, color: kWhiteColor),
                ),
                Text(
                  '******',
                  style: Theme.of(context).textTheme.headline4.copyWith(
                      fontWeight: FontWeight.bold, color: kLightLightBlue),
                ),
                Text(
                  'We have sent you a SMS \nwith 6 digit verification code',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(color: klightgrey),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //OTP Container
                      Container(
                        width: size.width * 0.8, //0.12
                        height: size.height * 0.1,

                        child: Center(
                          child: PinCodeFields(
                            keyboardType: TextInputType.number,
                            borderColor: kgrey,
                            fieldWidth: 10,
                            length: 6,
                            textStyle: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(color: kWhiteColor),
                            animationDuration:
                                const Duration(milliseconds: 100),
                            animationCurve: Curves.easeInOut,
                            switchInAnimationCurve: Curves.easeIn,
                            switchOutAnimationCurve: Curves.easeOut,
                            animation: Animations.SlideInDown,
                            onComplete: (output) {
                              setState(() {
                                otp = output;
                              });
                              if (otp.length == 6) {
                                _onFormSubmitted();
                              } else {
                                Toast.show("Invalid OTP", context,
                                    duration: Toast.LENGTH_SHORT,
                                    gravity: Toast.TOP);
                              }
                              print(output);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                /*Container(
                  width: size.width * 0.55,
                  child: RaisedButton(
                    hoverColor: kgrey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(29),
                        side: BorderSide(color: Colors.grey)),
                    color: kWhiteColor,
                    onPressed: () {
                      verifyPhone();
                    },
                    child: Text(
                      'send',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          color: kdarkBlue, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(20),
                  ),
                ),*/
                Container(
                  width: size.width * 0.55,
                  child: RaisedButton(
                    hoverColor: kgrey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(29),
                        side: BorderSide(color: Colors.grey)),
                    color: kWhiteColor,
                    onPressed: () {
                      if (otp.length == 6) {
                        _onFormSubmitted();
                      } else {
                        Toast.show("Invalid OTP", context,
                            duration: Toast.LENGTH_SHORT, gravity: Toast.TOP);
                      }
                    },
                    child: Text(
                      'Verify',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          color: kdarkBlue, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(20),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "I didn't receive a code !",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontSize: 18, color: kgrey),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 5),
                          child: Text(
                            'Resend',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(fontSize: 20, color: kWhiteColor),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

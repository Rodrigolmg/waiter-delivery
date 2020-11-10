import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'package:waiter_delivery/components/custom_text_widget.dart';
import 'package:waiter_delivery/components/login/custom_floating_button.dart';
import 'package:waiter_delivery/components/login/login_text_field.dart';
import 'package:waiter_delivery/screens/home_screen.dart';
import 'package:waiter_delivery/screens/signup/signup_screen.dart';
import 'package:waiter_delivery/stores/login_store.dart';
import 'package:waiter_delivery/util/custom_text.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin{

  final loginStore = LoginStore();

  AnimationController _animationController;
  Animation _translationAnimationOne;
  Animation _translationAnimationTwo;
  Animation _rotationAnimation;

  double getRadiansFromDegree(double degree){
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  // ANIMAÇÕES DOS FLOATINGBUTTONS
  _initAnimations(){
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 250)
    );

    _translationAnimationOne = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(tween: Tween(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(_animationController);

    _translationAnimationTwo = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(tween: Tween(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(_animationController);


    _rotationAnimation = Tween<double>(begin: 180.0, end: 0.0)
        .animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut
    )
    );

    _animationController.addListener(() {
      setState(() {

      });
    });
  }


  @override
  void initState() {
    super.initState();
    _initAnimations();
  }

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer = reaction(
        (_) => loginStore.loginSucceed,
        (loginSucceed) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => HomeScreen())
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                              child: Container(
                                width: 180,
                                height: 180,
                                child: Image(
                                  image: AssetImage("assets/icon/waiter.png"),
                                ),
                              )
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                              child: RichText(
                                text: TextSpan(
                                    style: GoogleFonts.lobster(
                                        fontSize: 50,
                                        color: Colors.amber[50]
                                    ),
                                    children: [
                                      TextSpan(text: CustomText.waiterTitle),
                                      TextSpan(text: " "),
                                      TextSpan(
                                        text: CustomText.deliveryTitle,
                                        style: GoogleFonts.lobster(
                                            fontSize: 50,
                                            color: Colors.orange
                                        ),
                                      ),
                                    ]
                                ),
                              )
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          LoginTextField(
                            hintText: CustomText.username,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          LoginTextField(
                            hintText: CustomText.password,
                            isPassword: true,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                              child: Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width / 1.5,
                                    child: Observer(
                                      builder: (_) => RaisedButton(
                                        onPressed: null,
                                        color: Colors.orange,
                                        disabledColor: Colors.orange.withAlpha(130),
                                        child: CustomTextWidget(
                                          CustomText.login,
                                          fontSize: 30,
                                        ),
                                        elevation: 1,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30)
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) =>
                                        SignUpScreen())
                                      );
                                    },
                                      child: RichText(
                                        text: TextSpan(
                                            style: GoogleFonts.lobster(
                                                fontSize: 18,
                                                color: Colors.amber[50]
                                            ),
                                            children: [
                                              TextSpan(text: CustomText.accountQuestion),
                                              TextSpan(text: " "),
                                              TextSpan(
                                                text: CustomText.signUpNow,
                                                style: GoogleFonts.lobster(
                                                    fontSize: 18,
                                                    color: Colors.orange
                                                ),
                                              ),
                                            ]
                                        ),
                                      )
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  GestureDetector(
                                    child: Text(
                                      CustomText.passwordQuestion,
                                      style: GoogleFonts.lobster(
                                          color: Colors.orange,
                                          fontSize: 17
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          )
                        ],
                      ),
                    )
                ),
            ),
            Positioned(
                right: 20,
                bottom: 20,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    IgnorePointer(
                      child: Container(
                        color: Colors.transparent, // comment or change to transparent color
                        height: 150.0,
                        width: 150.0,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset.fromDirection(
                        getRadiansFromDegree(180),
                        _translationAnimationOne.value * 100
                      ),
                      child: Transform(
                        transform: Matrix4.rotationZ(
                          getRadiansFromDegree(_rotationAnimation.value)
                        )..scale(_translationAnimationOne.value),
                        alignment: Alignment.center,
                        child: Observer(
                          builder: (_) => CustomFloatingButton(
                            color: Colors.blue,
                            width: 60,
                            height: 60,
                            icon: Icon(
                              FeatherIcons.facebook,
                              size: 26,
                              color: Colors.white,
                            ),
                            onPressed: loginStore.logInFB
                          ),
                        ),
                      ),
                    ),
                    Transform(
                      transform: Matrix4.rotationZ(
                          getRadiansFromDegree(_rotationAnimation.value)
                      ),
                      alignment: Alignment.center,
                      child: CustomFloatingButton(
                        color: Colors.amber,
                        width: 60,
                        height: 60,
                        icon: Icon(
                            Icons.menu
                        ),
                        onPressed: (){
                          if(_animationController.isCompleted){
                            _animationController.reverse();
                          } else {
                            _animationController.forward();
                          }
                        },
                      ),
                    ),
                  ],
                )
            )
          ]
        )
      ),
    );
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }
}

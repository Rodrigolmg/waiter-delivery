import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waiter_delivery/screens/login/login_screen.dart';
import 'package:waiter_delivery/util/custom_text.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{

  AnimationController _animationController;
  Animation _animation;

  _toNextPage() async {
    await Future.delayed(
      Duration(milliseconds: 4400),
      (){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    );
  }


  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1500));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    _toNextPage();
  }

  @override
  Widget build(BuildContext context) {

    Future.delayed(
        Duration(milliseconds: 1500),
            (){
          _animationController.forward();
        }
    );


    return Scaffold(
      body: SafeArea(
        child: Padding(
        padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Center(
                child: FlareActor("assets/flare/WaiterPray.flr", animation: "prayAnimation",),
              ),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
                child: FadeTransition(
                  opacity: _animation,
                  child: Center(
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
                  )
                )
              )
            ],
          ),
        )
      )
    );
  }
}

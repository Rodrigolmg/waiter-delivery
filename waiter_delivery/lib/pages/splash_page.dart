import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waiter_delivery/util/custom_text.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin{

  AnimationController _animationController;
  Animation _animation;

  _toNextPage() async {
    await Future.delayed(
      Duration(milliseconds: 4400),
      (){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Container()));
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
      backgroundColor: Color.fromRGBO(148, 106, 18, 1.0),
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
                    child: Text(
                      CustomText.splashTitle,
                      style: GoogleFonts.lobster(
                        color: Color.fromRGBO(245, 245, 220, 1.0),
                        fontSize: 50,
                      ),
                      softWrap: true,
                    ),
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

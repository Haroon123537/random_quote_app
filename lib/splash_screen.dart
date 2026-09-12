import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:random_quote_app/home_page.dart';

class SplashScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        opacity = 1.0;
      });
    });
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/liftapp.jpg', fit: BoxFit.cover),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.7, end: 1.0),
                  duration: Duration(milliseconds: 1200),
                  curve: Curves.easeOut,
                  builder: (context, scale, child) {
                    return Transform.scale(
                      scale: scale,
                      child: AnimatedOpacity(
                        opacity: scale == 0.7 ? 0.0 : 1.0,
                        duration: Duration(milliseconds: 1200),
                        child: child,
                      ),
                    );
                  },
                  child: Image.asset(
                    'assets/images/app_logo.png',
                    height: 200,
                    width: 200,
                  ),
                ),
                SizedBox(height: 5),

                AnimatedOpacity(
                  curve: Curves.easeOut,
                  opacity: opacity,
                  duration: Duration(milliseconds: 1800),
                  child: Text(
                    "Quote Flow",
                    style: TextStyle(
                      fontFamily: 'Poppins-Extrabold',
                      fontWeight: FontWeight.w800,
                      fontSize: 45,
                      color: Color(0xFFE9F6FB),
                      letterSpacing: -1.0,
                    ),
                  ),
                ),

                SizedBox(height: 3),
                AnimatedTextKit(
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    TyperAnimatedText(
                      "Inspiring minds, one quote at a time",
                      speed: Duration(milliseconds: 40),
                      curve: Curves.easeOut,
                      textStyle: TextStyle(
                        fontFamily: 'Poppins-Regular',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF00D9FF),
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

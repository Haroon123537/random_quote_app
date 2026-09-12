import 'package:flutter/material.dart';

class AdoutPage extends StatefulWidget {
  const new({super.key});

  @override
  State<AdoutPage> createState() => _AdoutPageState();
}

class _AdoutPageState extends State<AdoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF061B3A),
      appBar: AppBar(
        backgroundColor: Color(0xFFE9F6FB),
        elevation: 5.0,
        shadowColor: Color(0xFF00D9FF),
        title: Text('About Quote Flow'),
        titleTextStyle: TextStyle(
          letterSpacing: 2.0,
          fontSize: 22,
          fontFamily: 'Poppins-semibold',
          color: Color(0xFF00D9FF),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xFF168CFF),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              //First Container
              Container(
                // height: 300,
                // UPDATE: Keep height removed so the container can grow according to its content.

                width: double.infinity,
                margin: EdgeInsets.all(15.0),
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Color(0xFFfcfcfc),
                  border: Border.all(color: Color(0xFF00D9FF), width: 2.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),

                    Row(
                      children: [
                        Image.asset(
                          'assets/images/app_logo.png',
                          width: 70,
                          height: 70,
                        ),

                        SizedBox(width: 10),

                        // UPDATE: Expanded added here.
                        // This gives the title/subtitle only the remaining
                        // width available on the phone.
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Quote Flow',
                                style: TextStyle(
                                  fontSize: 23,
                                  fontFamily: ' Roboto-Black',
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.0,
                                  color: Color(0xFF000833),
                                ),
                              ),

                              SizedBox(height: 3),

                              Text(
                                "Inspiring minds, one quote at a time",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Inter_24pt-SemiBold',
                                  color: Color(0xFF01bbfe),
                                ),
                                softWrap: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 18),

                    Container(
                      // height: 150,
                      // UPDATE: Keep height removed.
                      // The cyan container now grows according to its content.

                      width: double.infinity,
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: Color(0xFF00D9FF),
                        border: Border.all(
                          color: Color(0xFFE9F6FB),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),

                      // UPDATE: Expanded REMOVED from here.
                      // Expanded cannot be directly inside a Container.
                      child: Column(
                        // UPDATE: stretch added so the description Text
                        // gets the available width and wraps correctly.
                        crossAxisAlignment: CrossAxisAlignment.stretch,

                        children: [
                          Text(
                            "Quote Flow is a simple and beautiful app that brings you inspiring quotes from great thinkers, leaders and writers. You can also translate the quotes into Urdu (and back to English) instantly using on-device translation.",
                            style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 1.0,
                              color: Color(0xFF000833),
                              fontFamily: ' Roboto-Black',
                              fontWeight: FontWeight.bold,
                            ),
                            softWrap: true,
                          ),

                          SizedBox(height: 17),

                          Container(
                            // height: 52,
                            // UPDATE: Keep height removed so the message
                            // can become multiple lines on a small screen.

                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFFe1f4fb),
                              border: Border.all(
                                color: Color(0xFF00D9FF),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            padding: EdgeInsets.all(12.0),

                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/heart_ image.png',
                                  height: 25,
                                  width: 25,
                                ),

                                SizedBox(width: 10),

                                // UPDATE:
                                // Expanded is now directly inside Row,
                                // which is the correct place for Expanded.
                                Transform.translate(
                                  offset: Offset(0, 2),

                                  // UPDATE:
                                  // Removed Expanded from inside Transform.
                                  // Transform can now safely contain the Text.
                                  child: Text(
                                    "Stay inspired. Learn new prespectives. Anytime, anywhere",
                                    style: TextStyle(
                                      fontFamily: 'Inter_24pt-SemiBold',
                                      color: Color(0xFF01bbfe),
                                      fontSize: 15,
                                    ),
                                    softWrap: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //Second Container
              SizedBox(height: 10),
              Container(
                height: 350,
                width: double.infinity,
                margin: EdgeInsets.all(15.0),
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Color(0xFFfcfcfc),
                  border: Border.all(color: Color(0xFF00D9FF), width: 2.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/book_image.png',
                          width: 70,
                          height: 70,
                        ),
                        SizedBox(width: 5),
                        Column(
                          children: [
                            Transform.translate(
                              offset: Offset(-69, -1),
                              child: Text(
                                'How To Use',
                                style: TextStyle(
                                  fontSize: 23,
                                  fontFamily: ' Roboto-Black',
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.0,
                                  color: Color(0xFF000833),
                                ),
                              ),
                            ),
                            SizedBox(height: 1),
                            Text(
                              "Follow these simple steps to get started",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Inter_24pt-SemiBold',
                                color: Color(0xFF01bbfe),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 100,
                      width: double.infinity,
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: Color(0xFF00D9FF),
                        border: Border.all(
                          color: Color(0xFFE9F6FB),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Color(0xFFe1f4fb),

                              border: Border.all(color: Color(0xFFe1f4fb)),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Center(
                              child: Text(
                                "1",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Color(0xFF000833),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(width: 20),
                          Image.asset(
                            'assets/images/image_1.png',
                            height: 75,
                            width: 75,
                          ),
                          SizedBox(width: 20),
                          Column(
                            children: [
                              Transform.translate(
                                offset: Offset(-140, 5),
                                child: Text(
                                  'Get Quotes',
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontFamily: ' Roboto-Black',
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.0,
                                    color: Color(0xFF000833),
                                  ),
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "Tap the 'Generate' button in home page to fetch new quote",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Inter_24pt-SemiBold',
                                  color: Color(0xFF000833),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 17),
                    Container(
                      height: 100,
                      width: double.infinity,
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: Color(0xFF00D9FF),
                        border: Border.all(
                          color: Color(0xFFE9F6FB),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Color(0xFFe1f4fb),

                              border: Border.all(color: Color(0xFFe1f4fb)),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Center(
                              child: Text(
                                "2",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Color(0xFF000833),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(width: 20),
                          Image.asset(
                            'assets/images/image_2.png',
                            height: 75,
                            width: 75,
                          ),
                          SizedBox(width: 20),
                          Column(
                            children: [
                              Transform.translate(
                                offset: Offset(-220, 5),
                                child: Text(
                                  'Translate',
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontFamily: ' Roboto-Black',
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.0,
                                    color: Color(0xFF000833),
                                  ),
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "Tap the 'Translate' iconbutton in home page to convert english quote into Urdu.",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Inter_24pt-SemiBold',
                                  color: Color(0xFF000833),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 250,
                width: double.infinity,
                margin: EdgeInsets.all(15.0),
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Color(0xFFfcfcfc),
                  border: Border.all(color: Color(0xFF00D9FF), width: 2.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/image_3.png",
                          height: 80,
                          width: 80,
                        ),
                        SizedBox(width: 5),
                        Column(
                          children: [
                            Transform.translate(
                              offset: Offset(-75, 7),
                              child: Text(
                                "We'd Love to hear from you",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: ' Roboto-Black',
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.0,
                                  color: Color(0xFF000833),
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'If you have any suggestions, feedback or ideas for improvement.\n'
                              'Feel free to reach out to us.',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Inter_24pt-SemiBold',
                                color: Color(0xFF000833),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 18),
                    Container(
                      height: 60,
                      width: double.infinity,
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: Color(0xFF00D9FF),
                        border: Border.all(
                          color: Color(0xFFE9F6FB),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/image_3.png',
                            height: 50,
                            width: 50,
                            color: Color(0xFFE9F6FB),
                          ),
                          SizedBox(width: 1),
                          Transform.translate(
                            offset: Offset(2, 1),
                            child: Text(
                              "haroonrafi672@gmail.com",
                              style: TextStyle(
                                color: Color(0xFFE9F6FB),
                                fontSize: 17,
                                fontFamily: 'Inter_24pt-SemiBold',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Thankyou for using QuoteFlow",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Inter_24pt-SemiBold',
                        color: Color(0xFF000833),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

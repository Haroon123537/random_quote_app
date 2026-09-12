import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:random_quote_app/adout_page.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
//import 'package:random_quote_app/profile_page.dart';

import 'Model/model_file.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Welcome? welcome;
  bool isloading = false;
  bool isloading1 = false;
  bool isloading2 = false;
  bool isloading3 = false;
  bool isUrdu = false;
  int currentIndex = 0;
  //First create the list where we store the translated quotes and authors
  List<String> translatedQuotes = [];
  List<String> translatedAuthors = [];

  //Create the translator along with its objects
  OnDeviceTranslator? translator;

  // Then we create the model manager to download the models
  OnDeviceTranslatorModelManager modelManager =
      OnDeviceTranslatorModelManager();

  //Create the core function that do translation and store it in a list
  Future<void> translateText() async {
    //First check if the no data then return null
    if (welcome == null) return;

    //Now if there is data then
    if (isUrdu == false) {
      translator = OnDeviceTranslator(
        sourceLanguage: TranslateLanguage.english,
        targetLanguage: TranslateLanguage.urdu,
      );

      //Clearing the list before adding new translated quotes and author
      translatedQuotes.clear();
      translatedAuthors.clear();

      for (var quote in welcome!.quotes) {
        String translatedQuote = await translator!.translateText(quote.quote);
        String translatedAuthor = await translator!.translateText(quote.author);
        translatedQuotes.add(translatedQuote);
        translatedAuthors.add(translatedAuthor);
      }

      isUrdu = true;
    } else {
      translatedQuotes.clear();
      translatedAuthors.clear();
    }
    setState(() {});
  }

  Future<void> getquote() async {
    final response = await http.get(Uri.parse("https://dummyjson.com/quotes"));
    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        isloading = false;
      });
    });
    if (response.statusCode == 200) {
      setState(() {
        welcome = welcomeFromJson(response.body);
      });
    } else {
      print("Failed to load quotes");
    }
  }

  @override
  void initState() {
    downloadmodel();
    super.initState();
  }

  void downloadmodel() async {
    //First chech whether models are downloaded or not
    bool isEnglish = await modelManager.isModelDownloaded(
      TranslateLanguage.english.bcpCode,
    );

    bool isUrdu = await modelManager.isModelDownloaded(
      TranslateLanguage.urdu.bcpCode,
    );

    //Now download models
    if (!isEnglish) {
      bool result = await modelManager.downloadModel(
        TranslateLanguage.english.bcpCode,
      );
      print("downloaded sucessfully: $result");
    }

    if (!isUrdu) {
      bool result1 = await modelManager.downloadModel(
        TranslateLanguage.urdu.bcpCode,
      );
      print("downloaded sucessfully: $result1");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF061B3A),
      appBar: AppBar(
        actions: [
          IconButton(
            tooltip: "Take guidance",
            onPressed: () {
              setState(() {
                isloading3 = true;
              });
              try {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdoutPage()),
                );
              } catch (e) {
                print(e.toString());
              }
            },
            icon: isloading3
                ? CircularProgressIndicator()
                : Icon(color: Color(0xFF168CFF), Icons.help),
          ),
          SizedBox(width: 8),

          IconButton(
            onPressed: () async {
              setState(() {
                isloading1 = true;
              });
              await Future.delayed(Duration(seconds: 2));
              try {
                await translateText();
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Translation failed: ${e.toString()}"),
                  ),
                );
              } finally {
                setState(() {
                  isloading1 = false;
                });
              }
            },
            tooltip: "Translate the quote",
            icon: isloading1
                ? CircularProgressIndicator(
                    color: Color(0xFF00D9FF),
                    strokeWidth: 2.0,
                  )
                : Icon(color: Color(0xFF168CFF), Icons.translate),
          ),
          SizedBox(width: 5),
        ],
        backgroundColor: Color(0xFFE9F6FB),
        elevation: 5.0,
        shadowColor: Color(0xFF00D9FF),
        title: Text("Quote Flow"),
        //centerTitle: true,
        titleTextStyle: TextStyle(
          letterSpacing: 2.0,
          fontSize: 22,
          fontFamily: 'Poppins-semibold',
          color: Color(0xFF00D9FF),
        ),
      ),

      body: welcome == null
          ? Center(
              child: AnimatedTextKit(
                isRepeatingAnimation: false,
                animatedTexts: [
                  WavyAnimatedText(
                    speed: Duration(milliseconds: 40),
                    "Press Generate to get quotes",
                    textStyle: TextStyle(
                      fontFamily: "Poppins-Medium",
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFE9F6FB),
                      fontSize: 20,
                      letterSpacing: 0.3,
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF00CBFC),
                  border: Border.all(color: Color(0xFFF4F9FC), width: 3.0),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFF00D9FF),
                      blurRadius: 8.0,
                      spreadRadius: 0.5,
                      offset: Offset(4.0, 4.0),
                    ),
                  ],
                ),
                margin: const EdgeInsets.all(10),
                height: 200,
                padding: const EdgeInsets.all(20),
                child: Stack(
                  children: [
                    Center(
                      child: Text(
                        translatedQuotes.isEmpty
                            ? welcome!.quotes[currentIndex].quote
                            : translatedQuotes[currentIndex],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFFE4EDFD),
                          fontFamily: "Lora-BoldItalic",
                          fontSize: 21,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 5,
                      right: 10,
                      child: Text(
                        translatedAuthors.isEmpty
                            ? welcome!.quotes[currentIndex].author
                            : translatedAuthors[currentIndex],
                        style: const TextStyle(
                          fontFamily: "Inter-SemiBold",
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Color(0xFFEEF6FB),
                          letterSpacing: 0.7,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      floatingActionButton: isloading
          ? Align(
              alignment: Alignment.bottomCenter,
              child: CircularProgressIndicator(
                color: Color(0xFFe5f7fc),
                strokeWidth: 3.0,
              ),
            )
          : Align(
              alignment: AlignmentGeometry.bottomCenter,
              child: SizedBox(
                width: 100,
                child: FloatingActionButton(
                  tooltip: "press to generate quotes",
                  hoverElevation: 10.0,
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 3.0,
                      style: BorderStyle.solid,
                      color: Color(0xFF80f5fc),
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    //borderRadius: BorderRadius.circular(10.0),
                  ),
                  hoverColor: Color(0xFFb1bcfa),
                  onPressed: () async {
                    setState(() {
                      isloading = true;
                    });

                    try {
                      if (welcome == null) {
                        await getquote();
                      } else {
                        setState(() {
                          currentIndex++;

                          if (currentIndex >= welcome!.quotes.length) {
                            currentIndex = 0;
                          }
                        });
                      }
                    } catch (e) {
                      print(e.toString());
                    } finally {
                      setState(() {
                        isloading = false;
                      });
                    }
                  },
                  backgroundColor: Color(0xFFe5f7fc),
                  foregroundColor: Color(0xFFa843fb),
                  //splashColor: Color(0xFF00D9FF),
                  child: Text(
                    "Generate",
                    style: TextStyle(
                      fontFamily: "Inter-SemiBold",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF6C3BFF),
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}

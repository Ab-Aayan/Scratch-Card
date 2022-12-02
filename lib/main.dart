import 'package:flutter/material.dart';

import 'package:scratcher/scratcher.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AppBody(),
  ));
}

class AppBody extends StatefulWidget {
  AppBody({super.key});

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  double _opacity = 0.0;

  Future<void> scratchCardDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          title: const Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 24.0),
              child: Text(
                'You\'ve won a scratch card',
                style: TextStyle(
                    //color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    //backgroundColor: Colors.blue,
                    fontSize: 18),
              ),
            ),
          ),
          content: StatefulBuilder(
            builder: (context, StateSetter setState) {
              return Scratcher(
                accuracy: ScratchAccuracy.low,
                threshold: 25,
                brushSize: 50,
                onThreshold: () {
                  setState(() {
                    _opacity = 1;
                  });
                },
                image: Image.asset("assets/diamond_bw.png"),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 50),
                  opacity: _opacity,
                  child: Container(
                    height: 250,
                    width: 300,
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 38.0),
                          child: AlertDialog(
                            title: Align(
                              alignment: Alignment.center,
                              child: Text(
                                '5\$',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          'Congratulations 🔥',
                          style: TextStyle(
                              fontSize: 24,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Claim Reward'),
                            ))
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/screen-0.webp'), fit: BoxFit.cover),
      ),
      child: Center(
        child: Stack(
          children: [
            Center(
                child: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.0,
                    // margin: const EdgeInsets.all(92),
                    child: ElevatedButton(
                      onPressed: () => scratchCardDialog(context),
                      child: Ink(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Container(
                          constraints: const BoxConstraints(
                              maxWidth: 80.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: const Text(
                            "Play",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

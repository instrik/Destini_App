y// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'story_brain.dart';

void main() => runApp(Destini());

// trial comment 3

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text('Destini App'),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      storyBrain.getStory(),
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.red.shade900,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        storyBrain.nextStory(1);
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        textAlign: TextAlign.center,
                        storyBrain.getChoice1(),
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.blue.shade900,
                  child: Visibility(
                    visible: storyBrain.buttonShouldBeVisible(),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          storyBrain.nextStory(2);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          textAlign: TextAlign.center,
                          storyBrain.getChoice2(),
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


































































































































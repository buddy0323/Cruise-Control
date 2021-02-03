import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class MenuItem {
  final String name;
  final String animation;
  MenuItem(this.name, this.animation);
}

class RecordingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen> {
  stt.SpeechToText _speechToText;
  bool _isListening = false;
  String _text = 'Press and Speak';
  double _confidence = 1.0;

  @override
  void initState() {
    super.initState();
    _speechToText = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.black87,
        centerTitle: false,
        elevation: 0.0,
        title: Text(
          'Voice Input',
          style: TextStyle(
            fontSize: 22.0,
            letterSpacing: 1.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 0),
        decoration: BoxDecoration(
          color: Color(0xFF212121)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      alignment: Alignment.center,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 30, 30, 150.0),
                      alignment: Alignment.center,
                      child: Text(
                        _text,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w200,
                          color: Colors.white
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white10,
                      alignment: Alignment.bottomCenter,
                      child: Stack(
                        children: [
                          _flare(MenuItem('recording', 'analysis')),
                        ]
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _flare(MenuItem item) {
    return GestureDetector(
      child: AspectRatio(
        aspectRatio: 0.4,
        child: Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: FlareActor(
            'assets/flare/${item.name}.flr',
            alignment: Alignment.bottomCenter,
            fit: BoxFit.contain,
            animation: item.animation,
          ),
        ),
      ),
      onTap: () {
        setState(() {
          _listen();
        });
      },
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speechToText.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speechToText.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speechToText.stop();
    }
  }
}


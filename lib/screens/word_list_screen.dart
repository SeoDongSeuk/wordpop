import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/timer_display.dart'; // 타이머 위젯 임포트
import '../widgets/result_dialog.dart'; // 결과창 임포트

class WordListScreen extends StatefulWidget {
  final String levelName;
  final int timeLimit; // 시간제한을 매개변수로 받습니다.

  const WordListScreen(
      {super.key, required this.levelName, required this.timeLimit});

  @override
  State<WordListScreen> createState() => _WordListScreenState();
}

class _WordListScreenState extends State<WordListScreen> {
  List<String> _words = [];
  int _currentWordIndex = 0;
  String _currentWord = "";
  String _currentMeaning = "";
  List<String> _options = [];
  bool _isAnswered = false;
  bool _isCorrect = false;
  late int _currentTime; // 남은 시간 (초)
  Timer? _timer; // 타이머 객체
  int _correctCount = 0; // 정답 개수를 저장할 변수

  @override
  void initState() {
    super.initState();
    _loadWords();
    _currentTime = widget.timeLimit; //남은시간을 설정합니다.
    _startTimer(); // 모든 단계에서 타이머를 시작합니다.
  }

  // 타이머 시작 함수
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_currentTime > 0) {
        setState(() {
          _currentTime--;
        });
      } else {
        _timer?.cancel(); // 타이머 종료
        ResultDialog.show(context, _correctCount); //결과창 생성
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // 위젯이 제거될 때 타이머를 종료합니다.
    super.dispose();
  }

  Future<void> _loadWords() async {
    final prefs = await SharedPreferences.getInstance();
    final words = prefs.getStringList(widget.levelName) ?? [];
    setState(() {
      _words = words;
      _prepareQuestion();
    });
  }

  void _nextWord() {
    setState(() {
      _isAnswered = false;
      _isCorrect = false;
      _currentWordIndex = (_currentWordIndex + 1) % _words.length;
      _prepareQuestion();
    });
  }

  void _prepareQuestion() {
    final wordPair = _words[_currentWordIndex].split('-');
    _currentWord = wordPair[0];
    _currentMeaning = wordPair[1];

    final wrongOptions = <String>[];
    while (wrongOptions.length < 3) {
      final randomWord = _words[Random().nextInt(_words.length)].split('-')[1];
      if (randomWord != _currentMeaning && !wrongOptions.contains(randomWord)) {
        wrongOptions.add(randomWord);
      }
    }

    _options = [...wrongOptions, _currentMeaning]..shuffle();
  }

  void _checkAnswer(String selectedOption) {
    setState(() {
      _isAnswered = true;
      _isCorrect = selectedOption == _currentMeaning;
    });
    if (_isCorrect) {
      _correctCount++; // 정답 개수 증가
      Future.delayed(const Duration(seconds: 1), () {
        _nextWord();
      });
    } else {
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _isAnswered = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_words.isEmpty) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.levelName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0, top: 20.0),
                child: TimerDisplay(currentTime: _currentTime), //타이머 위젯 생성
              ),
            ),
            Expanded(
              flex: 4,
              child: Center(
                child: Text(
                  _currentWord,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 48, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  ..._options.map(
                    (option) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                        onPressed: _isAnswered
                            ? null
                            : () {
                                _checkAnswer(option);
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _isAnswered
                              ? option == _currentMeaning
                                  ? Colors.green
                                  : Colors.red
                              : null,
                          minimumSize: const Size(200, 50),
                        ),
                        child: Text(option),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (_isAnswered)
                    Center(
                      child: Text(
                        _isCorrect ? '정답입니다!' : '오답입니다.',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

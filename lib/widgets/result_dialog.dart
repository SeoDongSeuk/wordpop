import 'package:flutter/material.dart';

class ResultDialog {
  static void show(BuildContext context, int correctCount) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('결과입니다!'),
            content: Text('$correctCount 문제 맞추셨어요~\n더 열심히 하세요~'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context); //메인으로 이동
                  },
                  child: const Text("확인"))
            ],
          );
        });
  }
}

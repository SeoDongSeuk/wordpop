import 'package:flutter/material.dart';
import 'models/level.dart';
import 'data/initial_words.dart';
import 'screens/word_list_screen.dart';
import 'data/time_limit.dart';

void main() {
  runApp(const WordPopApp());
}

class WordPopApp extends StatelessWidget {
  const WordPopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Pop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WordPopHomePage(),
    );
  }
}

class WordPopHomePage extends StatefulWidget {
  const WordPopHomePage({super.key});

  @override
  State<WordPopHomePage> createState() => _WordPopHomePageState();
}

class _WordPopHomePageState extends State<WordPopHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showInfoDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
        );
      },
    );
  }

  List<Level> levels = [
    Level(name: '유아 단계', icon: Icons.child_care, color: Colors.deepPurple),
    Level(name: '초등 저학년 단계', icon: Icons.school, color: Colors.green),
    Level(name: '초등 중학년 단계', icon: Icons.school_outlined, color: Colors.orange),
    Level(name: '초등 고학년 단계', icon: Icons.school, color: Colors.blue),
    Level(name: '중학 저학년 단계', icon: Icons.menu_book, color: Colors.purple),
    Level(
        name: '중학 고학년 단계',
        icon: Icons.menu_book_outlined,
        color: Colors.deepOrange),
    Level(name: '고교 저학년 단계', icon: Icons.local_library, color: Colors.indigo),
    Level(name: '고교 고학년 단계', icon: Icons.library_books, color: Colors.teal),
    Level(
        name: '대학 기초 단계',
        icon: Icons.local_library_outlined,
        color: Colors.brown),
    Level(name: '대학 심화 단계', icon: Icons.library_add, color: Colors.cyan),
    Level(name: '일반 직장인 단계', icon: Icons.work, color: Colors.blueGrey),
    Level(name: '전문 직장인 단계', icon: Icons.business, color: Colors.brown),
    Level(name: '마스터 단계', icon: Icons.star, color: Colors.amber),
  ];

  @override
  void initState() {
    super.initState();
    InitialWords.initializeWords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: const Text('Word Pop'),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  'Word Pop 메뉴',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Info'),
              visualDensity: const VisualDensity(vertical: 4),
              onTap: () {
                Navigator.pop(context);
                _showInfoDialog('Info', 'Word Pop 앱에 대한 정보입니다.');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              visualDensity: const VisualDensity(vertical: 4),
              onTap: () {
                Navigator.pop(context);
                _showInfoDialog('Settings', '설정 페이지 입니다.');
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              visualDensity: const VisualDensity(vertical: 4),
              onTap: () {
                Navigator.pop(context);
                _showInfoDialog('Logout', '로그아웃 됩니다.');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1.5,
          ),
          itemCount: levels.length,
          itemBuilder: (context, index) {
            // 단계별 시간 제한 설정
            final int timeLimit = LevelTimeLimit.getTimeLimit(
                levels[index].name); // timeLimit 변수를 분리했습니다.

            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: InkWell(
                onTap: () {
                  // 각 단계 선택 시 동작
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WordListScreen(
                        levelName: levels[index].name,
                        timeLimit: timeLimit,
                      ),
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      levels[index].icon,
                      size: 40,
                      color: levels[index].color,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      levels[index].name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

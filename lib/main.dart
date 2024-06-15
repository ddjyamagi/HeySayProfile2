import 'package:flutter/material.dart';

void main() {
  // test
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '平成プロフ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Madou',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color backgroundColor = Color.fromARGB(255, 255, 30, 184);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '平成プロフ',
                style: TextStyle(fontSize: 32, color: Colors.white, fontFamily: 'Madou'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(backgroundColor: backgroundColor),
                    ),
                  );
                },
                child: Text(
                  'プロフを書く',
                  style: TextStyle(color: Colors.black, fontFamily: 'Madou'),
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ColorButton(
                    color: Colors.blue,
                    onPressed: () {
                      setState(() {
                        backgroundColor = Colors.blue;
                      });
                    },
                  ),
                  ColorButton(
                    color: Colors.green,
                    onPressed: () {
                      setState(() {
                        backgroundColor = Colors.green;
                      });
                    },
                  ),
                  ColorButton(
                    color: Colors.purple,
                    onPressed: () {
                      setState(() {
                        backgroundColor = Colors.purple;
                      });
                    },
                  ),
                  ColorButton(
                    color: Color.fromARGB(255, 255, 30, 184),
                    onPressed: () {
                      setState(() {
                        backgroundColor = Color.fromARGB(255, 255, 30, 184);
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final Color backgroundColor;

  ProfilePage({required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: Text(
            '平成プロフィール',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontFamily: 'Madou'),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProfileQuestion(question: 'HN', backgroundColor: backgroundColor),
                ProfileQuestion(question: '学年', backgroundColor: backgroundColor),
                ProfileQuestion(question: '兎に角主張したいこと', backgroundColor: backgroundColor),
                ProfileQuestion(question: 'ここだけの話', backgroundColor: backgroundColor),
                ProfileQuestion(question: 'ゲストブック', backgroundColor: backgroundColor),
                SizedBox(height: 10), // 追加: ボタンを上に10ピクセルずらすための余白
                ElevatedButton(
                  onPressed: () {
                    showPopup(context);
                  },
                  child: Text(
                    '入力完了',
                    style: TextStyle(fontFamily: 'Madou'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('平成プロフィール完成✌️', style: TextStyle(fontFamily: 'Madou')),
          content: RichText(
            text: TextSpan(
              text: 'スクリーンショットをしてPortFolderに共有しよう！\n\n',
              style: TextStyle(color: Colors.black, fontFamily: 'Madou'),
              children: [
                TextSpan(
                  text: ' PortFolderとは弊社が作っている”新感覚SNS”サービスのことです。\n\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Madou',
                  ),
                ),
                TextSpan(
                  text: 'ポートフォルダで検索🔍してみてね！',
                  style: TextStyle(fontFamily: 'Madou'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('閉じる', style: TextStyle(fontFamily: 'Madou')),
            ),
          ],
        );
      },
    );
  }
}

class ProfileQuestion extends StatelessWidget {
  final String question;
  final Color backgroundColor;

  ProfileQuestion({required this.question, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3),
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(bottom: 16),
          child: Text(
            question,
            style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Madou'),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            style: TextStyle(color: Colors.white, fontFamily: 'Madou'),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class ColorButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;

  ColorButton({required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
        ),
      ),
    );
  }
}

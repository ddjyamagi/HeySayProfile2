// MyHomePageウィジェットの状態を管理するためのステートフルウィジェット
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color backgroundColor = const Color.fromARGB(255, 255, 30, 184);
  // 背景色の初期値
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // 戻るボタンのアイコン
          onPressed: () {
            Navigator.pop(context); // 前の画面に戻る
          },
        ),
        title: const Text('平成プロフィール'), // アプリバーのタイトル
      ),
      backgroundColor: backgroundColor, // 背景色
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '平成プロフ', // テキスト
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontFamily: 'Madou',
                ), // テキストのスタイル
              ),
              const SizedBox(height: 20), // 高さ20のスペース
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // ボタンの背景色
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) {
                        return ProfilePage(backgroundColor: backgroundColor);
                      }, // ProfilePageへ遷移
                    ),
                  );
                },
                child: const Text(
                  'プロフを書く', // ボタンのテキスト
                  style: TextStyle(color: Colors.black, fontFamily: 'Madou'),
                ),
              ),
              const SizedBox(height: 40), // 高さ40のスペース
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ColorButton(
                    color: Colors.blue, // ボタンの色
                    onPressed: () {
                      setState(() {
                        backgroundColor = Colors.blue; // 背景色を変更
                      });
                    },
                  ),
                  ColorButton(
                    color: Colors.green, // ボタンの色
                    onPressed: () {
                      setState(() {
                        backgroundColor = Colors.green; // 背景色を変更
                      });
                    },
                  ),
                  ColorButton(
                    color: Colors.purple, // ボタンの色
                    onPressed: () {
                      setState(() {
                        backgroundColor = Colors.purple; // 背景色を変更
                      });
                    },
                  ),
                  ColorButton(
                    color: const Color.fromARGB(255, 255, 30, 184), // ボタンの色
                    onPressed: () {
                      setState(() {
                        backgroundColor = const Color.fromARGB(
                          255,
                          255,
                          30,
                          184,
                        ); // 背景色を変更
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

// プロフィールページのウィジェット
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.backgroundColor});
  final Color backgroundColor; // コンストラクタ

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // タップ時にキーボードを閉じる
      },
      child: Scaffold(
        backgroundColor: backgroundColor, // 背景色
        appBar: AppBar(
          backgroundColor: backgroundColor, // アプリバーの背景色
          title: const Text(
            '平成プロフィール', // アプリバーのタイトル
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontFamily: 'Madou'),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back), // 戻るボタンのアイコン
            onPressed: () {
              Navigator.pop(context); // 前の画面に戻る
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16), // パディング
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProfileQuestion(
                  question: 'HN',
                  backgroundColor: backgroundColor,
                ), // 質問
                ProfileQuestion(
                  question: '学年',
                  backgroundColor: backgroundColor,
                ), // 質問
                ProfileQuestion(
                  question: '兎に角主張したいこと',
                  backgroundColor: backgroundColor,
                ), // 質問
                ProfileQuestion(
                  question: 'ここだけの話',
                  backgroundColor: backgroundColor,
                ), // 質問
                ProfileQuestion(
                  question: 'ゲストブック',
                  backgroundColor: backgroundColor,
                ), // 質問
                const SizedBox(height: 10), // 高さ10のスペース
                ElevatedButton(
                  onPressed: () {
                    showPopup(context); // ポップアップを表示
                  },
                  child: const Text(
                    '入力完了', // ボタンのテキスト
                    style: TextStyle(fontFamily: 'Madou'), // テキストのスタイル
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ポップアップを表示する関数
  void showPopup(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            '平成プロフィール完成✌️',
            style: TextStyle(fontFamily: 'Madou'),
          ), // ポップアップのタイトル
          content: RichText(
            text: const TextSpan(
              text: 'スクリーンショットをしてPortFolderに共有しよう！\n\n', // ポップアップの内容
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Madou',
              ), // テキストのスタイル
              children: [
                TextSpan(
                  text: ' PortFolderとは弊社が作っている"新感覚SNS"サービスのことです。\n\n',
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
                Navigator.of(context).pop(); // ポップアップを閉じる
              },
              child: const Text(
                '閉じる',
                style: TextStyle(fontFamily: 'Madou'),
              ), // ボタンのテキスト
            ),
          ],
        );
      },
    );
  }
}

// 質問ウィジェット
class ProfileQuestion extends StatelessWidget {
  const ProfileQuestion({
    super.key,
    required this.question,
    required this.backgroundColor,
  });
  final String question;
  final Color backgroundColor; // コンストラクタ

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3), // 背景色
          padding: const EdgeInsets.all(16), // パディング
          margin: const EdgeInsets.only(bottom: 16), // マージン
          child: Text(
            question, // 質問テキスト
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Madou',
            ), // テキストのスタイル
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16), // パディング
          decoration: BoxDecoration(
            color: backgroundColor, // 背景色
            borderRadius: BorderRadius.circular(8), // 角の丸み
          ),
          child: const TextField(
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Madou',
            ), // テキストフィールドのスタイル
            decoration: InputDecoration(
              border: InputBorder.none, // ボーダーなし
            ),
          ),
        ),
        const SizedBox(height: 20), // 高さ20のスペース
      ],
    );
  }
}

// カラーボタンウィジェット
class ColorButton extends StatelessWidget {
  const ColorButton({super.key, required this.color, required this.onPressed});
  final Color color;
  final VoidCallback onPressed; // コンストラクタ

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8), // パディング
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // ボタンの背景色
          shape: const CircleBorder(), // ボタンの形状を円形に設定
          padding: const EdgeInsets.all(24), // パディング
        ),
        onPressed: onPressed, // ボタン押下時の動作
        child: Container(), // 空のコンテナ（中身はなし）
      ),
    );
  }
}

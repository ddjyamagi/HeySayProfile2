import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_project/profile.dart';

// アプリのエントリーポイント
void main() {
  runApp(const MyApp());
}

// アプリ全体のウィジェット
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kent\'s Brain', // アプリのタイトル
      theme: ThemeData(
        primarySwatch: Colors.blue, // アプリのテーマカラー
        fontFamily: 'Madou', // アプリ全体で使用するフォント
      ),
      home: const HomePage(), // アプリのホーム画面としてHomePageを設定
    );
  }
}

// アプリのホーム画面ウィジェット
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kent\'s Brain'), // アプリバーのタイトル
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '🧠', // 脳の絵文字
              style: TextStyle(fontSize: 100), // テキストのスタイル
            ),
            const SizedBox(height: 20), // 高さ20のスペース
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3, // グリッドの列数
              childAspectRatio: 2, // 子ウィジェットのアスペクト比
              children: List.generate(9, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8), // 各ボタンの周囲のパディング
                  child: ElevatedButton(
                    onPressed: () {
                      if (index == 0) {
                        // 一番左上のボタン
                        Navigator.push(
                          context,
                          MaterialPageRoute<Void>(
                            builder: (context) {
                              return const MyHomePage();
                            },
                          ),
                        );
                      } else {
                        // 他のボタンの機能をここに追加
                      }
                    },
                    child: Text('Button $index'), // ボタンのテキスト
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

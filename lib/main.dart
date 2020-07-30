import 'package:flutter/material.dart';
import 'soruHavuzu.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

main() => runApp(Quiz());

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Quiz Uygulaması"),
        backgroundColor: Color.fromRGBO(108, 135, 120, 1),
      ),
      backgroundColor: Color.fromRGBO(73, 69, 92, 1),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: QuizPage(),
      )),
    ));
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> sonucList = [];

  void soruCevapla(bool kullaniciCevap) {
    setState(() {
      bool dogruCevap = soruHavuzu.soruCevapGetir();
      if (soruHavuzu.sorularBittiMi() == true) {
        if (dogruCevap == kullaniciCevap) {
          dogruCevapSayisi++;
          sonucList.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          sonucList.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        quizBitir();
      } else {
        if (dogruCevap == kullaniciCevap) {
          dogruCevapSayisi++;
          sonucList.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          sonucList.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        soruHavuzu.sonrakiSoruGetir();
      }
    });
  }

  int dogruCevapSayisi = 0;
  void quizBitir() {
    Alert(
        context: context,
        type: AlertType.info,
        title: "Quiz Tamamlandı.",
        desc: "Doğru Cevap Sayısı: $dogruCevapSayisi/10",
        buttons: [
          DialogButton(
            child: Text(
              "Tamam",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ]).show();
    soruHavuzu.reset();
    sonucList = [];
    dogruCevapSayisi = 0;
  }

  SoruHavuzu soruHavuzu = SoruHavuzu();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 10,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                soruHavuzu.soruIndexGetir(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 10,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                soruHavuzu.soruTextGetir(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
                child: Padding(
              padding: EdgeInsets.fromLTRB(5, 1, 5, 100),
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.green,
                child: Text(
                  "Doğru",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                onPressed: () {
                  soruCevapla(true);
                },
              ),
            )),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(5, 1, 5, 100),
                child: FlatButton(
                  textColor: Colors.white,
                  color: Colors.red,
                  child: Text(
                    "Yanlış",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  onPressed: () {
                    soruCevapla(false);
                  },
                ),
              ),
            ),
          ],
        ),
        Container(
          color: Color.fromRGBO(250, 224, 15, 1),
          child: Padding(
            padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
            child: Row(
              children: sonucList,
            ),
          ),
        )
      ],
    );
  }
}
